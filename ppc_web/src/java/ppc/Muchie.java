package ppc;

import java.util.ArrayList;

public class Muchie {
    
    public Muchie(Statie destinatie_, double distanta_) {
        destinatie = destinatie_;
        distanta = distanta_;
    }
    
    public void adaugaLinie(String linie) {
        for (String ln : mijloaceTransport) {
            if (ln.equals(linie)) {
                return;
            }
        }
        mijloaceTransport.add(linie);
    }
    
    public Statie destinatie;
    
    public double distanta;
    
    public ArrayList<String> mijloaceTransport = new ArrayList<String>();
}
