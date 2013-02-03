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
    
    public void adaugaTransport(int destination, String linie) {
        Muchie m = linii.get(destination);
        if (m == null) {
            m = new Muchie(destination);
        }
        
        m.adaugaLinie(linie);
    }
    
    int id;
    
    public String nume;
    
    public String artera;
    
    public double longitudine;
    public double latitudine;
    
    public ArrayList<Statie> legaturi = new ArrayList<Statie>();
    
    public HashMap<Integer, Muchie> linii = new HashMap<Integer, Muchie>();
}
