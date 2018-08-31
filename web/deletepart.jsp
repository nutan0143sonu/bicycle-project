<%-- 
    Document   : delete
    Created on : Apr 13, 2018, 11:24:01 AM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <%
            int increment = 0; 
            
        Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st1=con.createStatement();
              String id = request.getParameter("id"); 
              String bill=(String)session.getAttribute("bill_id");
              String sql = "DELETE FROM customer_part_bill WHERE part_id='" + id+ "' and bill_id='"+bill+"'";
              boolean ps=st.execute(sql); 
              
            
                
                increment++;
                if(increment==1)
                {
                   out.print("<script>alert(\"part deleted\");</script>");
                }
                else 
                  out.print("<script>alert(\"part  not deleted\");</script>");
               
              response.sendRedirect("Bill.jsp");
        %>
  
    </body>
</html>
