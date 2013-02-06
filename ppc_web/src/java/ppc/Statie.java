package ppc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Statie {
    
    public Statie(int id_, String nume_, String artera_, double longitudine_, double latitudine_) {
        id = id_;
        nume = nume_;
        artera = artera_;
        longitudine = longitudine_;
        latitudine = latitudine_;
    }
    
    public void adaugaLegatura(Statie statieLegatura) {
        if (this.latitudine != 0 && statieLegatura.latitudine !=0 && getDistantaReala(this, statieLegatura) > 0.3) {
            return;
        }
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
    
    @Override
    public String toString() {
    	return nume + "/" + artera;
    }
    
    public static double getDistanta(Statie s1, Statie s2) {
        int R = 6371;
        double dLat = Math.toRadians(s2.latitudine-s1.latitudine);
        double dLon = Math.toRadians(s2.longitudine-s1.longitudine);
        double lat1 = Math.toRadians(s1.latitudine);
        double lat2 = Math.toRadians(s2.latitudine);

        double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));Random r = new Random();        
        double d = R * c;
        
        d = 0.3;
        if (r.nextDouble() < 0.1)
            d += r.nextDouble()/20;
        return d;
    }
    
    public static double getDistantaReala(Statie s1, Statie s2) {
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
