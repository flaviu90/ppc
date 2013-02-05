/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ppc;

import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DEEA
 */
@WebServlet(name = "detalii_statii", urlPatterns = {"/detalii_statii"})
public class detalii_statii extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String nume_statie = request.getParameter("statie");
            Statement stm = (Statement) DBHandler.getConnection().createStatement();
        ResultSet res = stm.executeQuery("SELECT linie,artera FROM detalii_statii WHERE nume='"+nume_statie+"';");
        out.println("<h2 id='numele_statiei'>" + nume_statie + "</h2>");
        out.println("<table id='detalii_statii'>");
        out.println("<tr id='detalii_statii'> <td id='detalii_statii'> Linia </td>  <td id='detalii_statii'> Artera </td> </tr>");
        
        while (res.next())
        {
            String linie = res.getString("linie");
            String artera = res.getString("artera");
            out.println("<tr id='detalii_statii'>  <td id='detalii_statii'> " + linie + "</td> <td id='detalii_statii'>" + artera + "</td> </tr>");
            
        }
        out.println("</table>");
        stm.close();
            
        } 
        catch (Exception e)
                {
                    
                }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
