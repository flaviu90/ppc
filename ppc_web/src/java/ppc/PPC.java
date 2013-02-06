package ppc;

import java.util.ArrayList;

public class PPC {

    public static void main(String[] args) {
        
        Graf G = new Graf();
        G.adaugaStatii();
        G.adaugaTrasee();
        
        /*
        Statie s = G.getStatie("UNIVERSITATE", "BD. REGINA ELISABETA");
        
        System.out.println(s.id + " " + s.nume + " " + s.artera + " " + s.latitudine + " " + s.longitudine);
        System.out.println("statii de legatura");
        for (Statie l : s.legaturi) {
            System.out.println(l.nume);
        }
        System.out.println("linii");
        for (Muchie m : s.linii.values()) {
            System.out.println(m.destinatie.nume + " " + m.distanta);
            for (String t : m.mijloaceTransport) {
                System.out.print(t + " ");
            }
            System.out.println();
        }
        */
        
        
        Statie s1 = G.getStatie("PIATA UNIRII", "STR. HALELOR");
        Statie s2 = G.getStatie("POD GROZAVESTI", "SPL. INDEPENDENTEI");
        G.getRuta(s1, s2);
    }
}
