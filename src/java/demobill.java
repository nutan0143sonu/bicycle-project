/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.*;
import java.sql.*;
/**
 *
 * @author Nutan Gupta
 */
@WebServlet(urlPatterns = {"/demobill"})
public class demobill extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           Engine engine= new Engine();            
          
          java.util.Date dt = new java.util.Date();
          
         java.text.SimpleDateFormat sdf = 
         new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

          String currentTime = sdf.format(dt);
          String customer=request.getParameter("ccustomer");
          String mobile=request.getParameter("cmobile");
          
          String sql="Select bill_id from bill order by timestamp desc limit 1";
          int newid=engine.getNewId(sql,"bill_id", 5);
          String rowid="cbill"+newid;
          out.println(rowid);
          String insertQuery="insert into bill(bill_id,customer_name,mobile_no,timestamp)values('"+rowid+"','"+customer+"','"+mobile+"','"+currentTime+"')";
         System.out.println(insertQuery);
          engine.executeQuery(insertQuery);
          out.println("bill id is generated successfully");
          
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
