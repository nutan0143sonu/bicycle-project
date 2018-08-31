<%-- 
    Document   : updateCycleRequest1
    Created on : Apr 26, 2018, 7:28:52 PM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update cycle Request  Page</title>
    </head>
    <body>
        <%!
          String cycle_id,quantity,request_id;
        %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
             cycle_id=request.getParameter("cycle_id");
             request_id=request.getParameter("request_id");
             System.out.println("cycle id is\t"+cycle_id);
             quantity=request.getParameter("quantity");
             System.out.println("quantity in textbox\t"+quantity);
             
             st.execute("update request_product set cycle_quantity="+quantity+" where cycle_id='"+cycle_id+"' and request_id='"+request_id+"'");
             response.sendRedirect("RequestProduct.jsp");
        %>
    </body>
</html>
