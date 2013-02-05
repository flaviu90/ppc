package ppc;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Graf {

    public Graf() {
    }
    public HashMap<IdentificatorStatie, Statie> tabelStatii = new HashMap<IdentificatorStatie, Statie>();
    private HashMap<Integer, Statie> idToStatie = new HashMap<Integer, Statie>();

    private class IdentificatorStatie {

        public IdentificatorStatie(String nume_, String artera_) {
            nume = nume_;
            artera = artera_;
        }

        @Override
        public boolean equals(Object obj) {
            if (!(obj instanceof IdentificatorStatie)) {
                return false;
            }
            IdentificatorStatie p = (IdentificatorStatie) obj;
            return (p.nume.equals(this.nume) && p.artera.equals(this.artera));
        }

        @Override
        public int hashCode() {
            return 17 * nume.hashCode() + 31 * artera.hashCode();
        }
        private String nume;
        private String artera;
    }
    
    private class Rezultat {
    	public Statie statie;
    	public double cost;
    	public int bus;
    	
    	Rezultat(Statie statie, double cost, int bus) {
    		this.statie = statie;
    		this.cost = cost;
    		this.bus = bus;
    	}
    	
    	@Override
    	public String toString() {
    		return statie.toString() + " " + cost + " " + bus;
    	}
    }

    public Statie getStatie(String nume, String artera) {
        return tabelStatii.get(new IdentificatorStatie(nume, artera));
    }

    // baga toate statiile din baza de date
    public void adaugaStatii() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ppc", "root", "");

            // Calculeaza statiile
            Statement stmt = (Statement) conn.createStatement();
            String query = "select * from statii";
            ResultSet rs = stmt.executeQuery(query);

            int nrStatii = 0;
            while (rs.next()) {
                String nume = rs.getString("nume");
                String artera = rs.getString("artera");
                double longitudine = rs.getDouble("longitudine");
                double latitudine = rs.getDouble("latitudine");

                ++nrStatii;
                Statie statie = new Statie(nrStatii, nume, artera, longitudine, latitudine);
                tabelStatii.put(new IdentificatorStatie(nume, artera), statie);
                idToStatie.put(statie.id, statie);
            }

            // Calculeaza legaturile
            stmt = (Statement) conn.createStatement();
            query = "select * from legaturi";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                String statie1 = rs.getString("statie1");
                String artera1 = rs.getString("artera1");
                String statie2 = rs.getString("statie2");
                String artera2 = rs.getString("artera2");

                Statie statie = tabelStatii.get(new IdentificatorStatie(statie1, artera1));
                statie.adaugaLegatura(tabelStatii.get(new IdentificatorStatie(statie2, artera2)));
            }

            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(Graf.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private class TraseeBuilder extends Thread {

        private ArrayList<String> linii = new ArrayList<String>();

        public TraseeBuilder(ArrayList<String> linii_) {
            linii = linii_;
        }

        @Override
        public void run() {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ppc", "root", "");

                // Calculeaza statiile
                Statement stmt = (Statement) conn.createStatement();

                for (String linie : linii) {
                    for (int i = 0; i < 2; ++i) {
                        String query = "select * from linii where linia=" + linie + " and sens=" + i + " order by nr";
                        /*
                         if (i == 1) {
                         query += " desc";
                         }*/
                        ResultSet rs = stmt.executeQuery(query);

                        int nrStatii = 0;
                        Statie start = null;
                        while (rs.next()) {
                            String numeStatie = rs.getString("numeStatie");
                            String artera = rs.getString("artera");
                            String linia = rs.getString("linia");
                            int nr = rs.getInt("nr");
                            int sens = rs.getInt("sens");

                            Statie destinatie = tabelStatii.get(new IdentificatorStatie(numeStatie, artera));
                            if (start != null) {
                                start.adaugaTransport(destinatie, linia);
                            }
                            start = destinatie;
                        }
                    }
                }
                conn.close();
            } catch (Exception ex) {
                Logger.getLogger(Graf.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // baga toate traseele din baza de date
    public void adaugaTrasee() {
        /*
         ArrayList<String> secvential = new ArrayList<String>();
         for (int i=1; i<=2000; ++i) {
         secvential.add("" + i);
         }
         TraseeBuilder worker = new TraseeBuilder(secvential);
         worker.start();
         try {
         worker.join();
         } catch (InterruptedException ex) {
         Logger.getLogger(Graf.class.getName()).log(Level.SEVERE, null, ex);
         }
         return;
         */

        int nrWorkers = 20;
        int sizePartitie = 35;
        ArrayList<String> partitie[] = new ArrayList[nrWorkers];
        for (int i = 0; i < nrWorkers; ++i) {
            partitie[i] = new ArrayList<String>();
            for (int j = sizePartitie * i + 1; j < sizePartitie * (i + 1); ++j) {
                partitie[i].add("" + j);
            }
        }

        ArrayList<TraseeBuilder> workers = new ArrayList<TraseeBuilder>();
        // init
        for (int i = 0; i < nrWorkers; ++i) {
            workers.add(new TraseeBuilder(partitie[i]));
        }
        // run
        for (TraseeBuilder worker : workers) {
            worker.start();
        }
        //join
        for (TraseeBuilder worker : workers) {
            try {
                worker.join();
            } catch (InterruptedException ex) {
                Logger.getLogger(Graf.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void getRuta(Statie start, Statie destinatie) {
        getRuta(start.id, destinatie.id);
    }

    // determina ruta pt id-uri
    public ArrayList<Rezultat> getRuta(int start, int destinatie) {
        // init
        for (int i = 0; i < Nmax; ++i) {
            for (int a = 0; a < Amax; ++a) {
                locks[i][a] = new ReentrantLock();
                cost[i][a] = Integer.MAX_VALUE;
            }
        }
        cost[start][0] = 0;
        parinte[start][0] = start;

        Q.add(start);

        // calculeaza
        while (!Q.isEmpty()) {
            Statie nod = idToStatie.get(Q.poll());

            if (FLAG_PARALEL) {
                new Worker(nod).start();
            }
            else {
                proceseaza(nod);
            }
            try {
                if (Q.isEmpty()) {
                    Thread.sleep(100);
                }
            } catch (InterruptedException ex) {
                Logger.getLogger(Graf.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // cel mai bun rezultat
        int best = 0;
        for (int a = 0; a < Amax; ++a) {
            if (cost[destinatie][a] < cost[destinatie][best]) {
                best = a;
            }
        }
        
        return drum(destinatie, best);
    }

    private class Worker extends Thread {

        private Statie s;

        public Worker(Statie s_) {
            s = s_;
        }

        @Override
        public void run() {
            for (int a = 0; a < Amax; ++a) {
                for (Statie next : s.legaturi) {
                    locks[next.id][0].lock();
                    try {
                        if (cost[s.id][a] + 1 < cost[next.id][0]) {
                            cost[next.id][0] = cost[s.id][a] + 1;
                            parinte[next.id][0] = s.id;
                            parinteBus[next.id][0] = a;
                            Q.add(next.id);
                            //System.out.println(next.id + " " + cost[next.id]);
                        }
                    } finally {
                        locks[next.id][0].unlock();
                    }
                }

                for (Muchie m : s.linii.values()) {
                    Statie next = m.destinatie;
                    for (String j : m.mijloaceTransport) {
                        int bus = Integer.parseInt(j);
                        locks[next.id][bus].lock();
                        try {
                            double extra = 0.5;
                            if (a == bus) {
                                extra = 0.0;
                            }
                            if (cost[s.id][a] + Statie.getDistanta(s, next) + extra < cost[next.id][bus]) {
                                cost[next.id][bus] = cost[s.id][a] + Statie.getDistanta(s, next) + extra;
                                parinte[next.id][bus] = s.id;
                                parinteBus[next.id][bus] = a;
                                Q.add(next.id);
                                //System.out.println("a");
                                //System.out.println(next.id + " " + cost[next.id]);

                            }
                        } finally {
                            locks[next.id][bus].unlock();
                        }
                    }
                }
            }
        }
    }

    private void proceseaza(Statie s) {
        for (int a = 0; a < Amax; ++a) {
            for (Statie next : s.legaturi) {
                locks[next.id][0].lock();
                try {
                    if (cost[s.id][a] + 1 < cost[next.id][0]) {
                        cost[next.id][0] = cost[s.id][a] + 1;
                        parinte[next.id][0] = s.id;
                        parinteBus[next.id][0] = a;
                        Q.add(next.id);
                        //System.out.println(next.id + " " + cost[next.id]);
                    }
                } finally {
                    locks[next.id][0].unlock();
                }
            }

            for (Muchie m : s.linii.values()) {
                Statie next = m.destinatie;
                for (String j : m.mijloaceTransport) {
                    int bus = Integer.parseInt(j);
                    locks[next.id][bus].lock();
                    try {
                        double extra = 0.5;
                        if (a == bus) {
                            extra = 0.0;
                        }
                        if (cost[s.id][a] + Statie.getDistanta(s, next) + extra < cost[next.id][bus]) {
                            cost[next.id][bus] = cost[s.id][a] + Statie.getDistanta(s, next) + extra;
                            parinte[next.id][bus] = s.id;
                            parinteBus[next.id][bus] = a;
                            Q.add(next.id);
                            //System.out.println("a");
                            //System.out.println(next.id + " " + cost[next.id]);

                        }
                    } finally {
                        locks[next.id][bus].unlock();
                    }
                }
            }
        }
    }

    private ArrayList<Rezultat> drum(int id, int bus) {
        System.out.println(idToStatie.get(id).nume + " " + cost[id][bus] + " " + bus);
        if (parinte[id][bus] == id) {
            ArrayList<Rezultat> r = new ArrayList<Rezultat>();
            r.add(new Rezultat(idToStatie.get(id), cost[id][bus], bus));
            return r;
        }
        ArrayList<Rezultat> r = drum(parinte[id][bus], parinteBus[id][bus]);
        r.add(new Rezultat(idToStatie.get(id), cost[id][bus], bus));
        return r;
    }
    private final int Nmax = 1300;
    private final int Amax = 800;
    double cost[][] = new double[Nmax][Amax];
    int parinte[][] = new int[Nmax][Amax];
    int parinteBus[][] = new int[Nmax][Amax];
    ReentrantLock locks[][] = new ReentrantLock[Nmax][Amax];
    ConcurrentLinkedQueue<Integer> Q = new ConcurrentLinkedQueue<Integer>();
    
    boolean FLAG_PARALEL = true;
}
