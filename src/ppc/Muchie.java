package ppc;

import java.util.ArrayList;

public class Muchie {
    
    public Muchie(int idStatie_) {
        idStatie = idStatie_;
    }
    
    public void adaugaLinie(String linie) {
        mijloaceTransport.add(linie);
    }
    
    public int idStatie;
    
    public ArrayList<String> mijloaceTransport = new ArrayList<String>();
}
