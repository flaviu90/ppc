package ppc;

import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vlad
 */
public class getStatii extends HttpServlet {

    public static ArrayList<String> getStatii()
    {
        ArrayList<String> statii = new ArrayList<String>();
        
        try {
        Statement stm = (Statement) DBHandler.getConnection().createStatement();
        ResultSet res = stm.executeQuery("SELECT DISTINCT nume, artera FROM statii;");
        
        while (res.next())
        {
            statii.add(res.getString(1) + "/" + res.getString(2));
        }
        stm.close();
        
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        return statii;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            ArrayList<String> statii = getStatii();
            Iterator it = statii.iterator();
            
            
            while (it.hasNext())
            {
                out.print(it.next());
                if (it.hasNext()) {
                    out.print(",");
                }
            }
                        
        } finally {            
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Get statii";
    }// </editor-fold>
}
