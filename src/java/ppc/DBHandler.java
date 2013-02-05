package ppc;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DEEA
 */
public class DBHandler {
    
    private static Connection dbcon = null ;
    
    static void init()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            dbcon = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ppc","root","");
        }
        
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
    }
    
    static Connection getConnection()
    {
        if (dbcon == null) init();
        return dbcon;
    }
    
    static void executeUpdate(String query)
    {
        try
        {
            Statement stm = (Statement) dbcon.createStatement();
            stm.executeUpdate(query);
            stm.close();
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
    }

    static boolean execute(String query)
    {
        boolean res = false;

        try
        {
            Statement stm = (Statement) dbcon.createStatement();
            res = stm.execute(query);
            stm.close();
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }

        return res;
    }


}
