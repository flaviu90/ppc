package ppc;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;


public class getLinii extends HttpServlet {
    
    public static ArrayList<String> getLinii(int from,int to)
    {
        ArrayList<String> linii = new ArrayList<String>();
        
        try {
        Statement stm = (Statement) DBHandler.getConnection().createStatement();
        ResultSet res = stm.executeQuery("SELECT DISTINCT linia FROM linii WHERE linia BETWEEN " +  from + " AND " + to + " ORDER BY CAST(linia AS signed) ;");
        
        while (res.next())
        {
            linii.add(res.getString(1));
        }
        stm.close();
        
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        return linii;
    }
    
}
