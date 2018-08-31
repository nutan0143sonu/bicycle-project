<%-- 
    Document   : addcycleRequest
    Created on : Apr 14, 2018, 6:59:58 PM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
   %>

        <%
    out.println("how are you");
            
               Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
      Statement st2=con.createStatement();
      Statement st1=con.createStatement();
      String cycle=request.getParameter("cycle");
      
      Statement st3=con.createStatement();
      Statement st4=con.createStatement();
      
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
         out.print(quantity);
        boolean i=st2.execute("insert into request_product(request_id,cycle_id,cycle_quantity)values('"+data+"','"+cycle+"','"+quantity+"')");
          
        out.print("<script>alert(\"cycle added \")</script>");
      response.sendRedirect("RequestProduct.jsp");
     
        }
       
     } catch(Exception e){System.out.println(e);
     }
  
%>  
    </body>
</html>
