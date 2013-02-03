package ppc;

import java.util.ArrayList;
import java.util.HashMap;

public class Statie {
    
    public Statie(int id_, String nume_, String artera_, double longitudine_, double latitudine_) {
        id = id_;
        nume = nume_;
        artera = artera_;
        longitudine = longitudine_;
        latitudine = latitudine_;
    }
    
    public void adaugaLegatura(Statie statieLegatura) {
        legaturi.add(statieLegatura);
    }
    
    public synchronized void adaugaTransport(Statie destinatie, String linie) {
        Muchie m = linii.get(destinatie.id);
        if (m == null) {
            m = new Muchie(destinatie, getDistanta(this, destinatie));
            linii.put(destinatie.id, m);
        }
        
        m.adaugaLinie(linie);
    }
    
    private double getDistanta(Statie s1, Statie s2) {
        int R = 6371;
        double dLat = Math.toRadians(s2.latitudine-s1.latitudine);
        double dLon = Math.toRadians(s2.longitudine-s1.longitudine);
        double lat1 = Math.toRadians(s1.latitudine);
        double lat2 = Math.toRadians(s2.latitudine);

        double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
        double d = R * c;
        return d;
    }
    
    int id;
    
    public String nume;
    
    public String artera;
    
    public double longitudine;
    public double latitudine;
    
    public ArrayList<Statie> legaturi = new ArrayList<Statie>();
    
    public HashMap<Integer, Muchie> linii = new HashMap<Integer, Muchie>();
}
