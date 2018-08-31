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
import java.util.*;

/**
 *
 * @author Nutan Gupta
 */
@WebServlet(urlPatterns = {"/cycleBill"})
public class cycleBill extends HttpServlet {

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
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;/* TODO output your page here. You may use following sample code. */
             try
        {
        Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
         st=con.createStatement();
        }catch(Exception e){
            
        }
              try
              {
             String sql="select company.company_name,color.color_name,cycle_model.model_name,cycle_frame.frame_size,cycle_frame.type from cycle INNER JOIN Company ON company.company_id=cycle.company_id INNER JOIN color ON color.color_id=cycle.color_id INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id"
                     + "";
              rs=st.executeQuery(sql);
              String data="";
              while(rs.next())
              {
                data +=rs.getString("cycle_model.model_name")+",";
              }
               data =data.substring(0,data.length()-1);
                 out.println(data);
              }catch(Exception e){e.printStackTrace();}
             
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
