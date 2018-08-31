<%-- 
    Document   : update
    Created on : Apr 13, 2018, 11:24:16 AM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update cycle Request Page</title>
    </head>
    <body>
        
      <%!
        String qu,id,request_id;
        int qua,quan;
      %>
        <%
             Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st3=con.createStatement();
              Statement st2=con.createStatement();
              Statement st4=con.createStatement();
              Statement st5=con.createStatement();
           
               id =request.getParameter("partid");
               System.out.println("Part id on update page"+id);
              String sql="select * from request_part where part_id= '"+id+"' and request_id='"+request_id+"'";
               System.out.println(sql);
              ResultSet rs=st.executeQuery(sql);
               request_id=(String)session.getAttribute("request_id");           
             
          if(rs.next()){
              qua=rs.getInt("quantity");
              System.out.println("quantity present in request_part\t"+qua);
          }
          String sql2="select quantity from parts where part_id='"+id+"'";
          System.out.println(sql2);
          ResultSet rs2=st2.executeQuery(sql2);
          while(rs2.next()){
              quan=rs2.getInt("quantity");
              System.out.println("quantity present parts table\t"+quan);
          }
        %>
        <form action="updatePartRequest1.jsp" method="get">
            <table>
                <tr><th colspan="2"><h1>Update Product</h1></tr>
                <tr><td><input type="hidden" name="part_id" value="<%=id%>"><input type="hidden" name="request_id" value="<%=request_id%>"></td></tr>
                <tr><th>Present Quantity</th><td><input type="text" name="present_quantity" value="<%=quan%>"></td></tr>
                <tr><th>Enter Quantity</th><td><input type="text" name="quantity" value="<%=qua%>"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit"></td></tr>
            </table>
        </form>
    </body>
</html>
