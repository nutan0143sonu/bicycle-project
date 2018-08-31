<%-- 
    Document   : addcycle
    Created on : Apr 11, 2018, 12:35:31 PM
    Author     : Nutan Gupta
--%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%!
  String data;
  String qu;
  String pn;
  String com;
  String col;
  String ps;
  String pt;
   %>

        <%
    out.println("how are you");
            
               Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
      Statement st2=con.createStatement();
      Statement st1=con.createStatement();
      String part=request.getParameter("part");
      Statement st3=con.createStatement();
      Statement st4=con.createStatement();
      Statement st5=con.createStatement();
           
       String sql1="select request_id from request order by timestamp desc limit 1";
        ResultSet rs1=st1.executeQuery(sql1);
     if(rs1.next())
     {
        data=rs1.getString("request_id");
     }
     try{
if(request.getParameter("submit")!=null)
     {
        
         String quantity=request.getParameter("quantity");
         
        boolean i=st2.execute("insert into request_part(request_id,part_id,quantity)values('"+data+"','"+part+"','"+quantity+"')");
           out.print("<script>alert(\"part added\")</script>");
     
        }
        response.sendRedirect("RequestProduct.jsp");
         
         }catch(Exception e){System.out.println(e);}    
%>
    </body>
</html>
