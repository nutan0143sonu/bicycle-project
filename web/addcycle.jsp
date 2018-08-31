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
      String sql3="select quantity from cycle where cycle_id = '"+cycle+"' ";
      ResultSet rs3=st3.executeQuery(sql3);
      if(rs3.next())
      {
        qu=rs3.getString(1);
      }
      int qua=Integer.parseInt(qu);
      
       String sql1="select bill_id from bill order by timestamp desc limit 1";
        ResultSet rs1=st1.executeQuery(sql1);
     if(rs1.next())
     {
        data=rs1.getString("bill_id");
     }
if(request.getParameter("submit")!=null)
     {
        
         String quantity=request.getParameter("quantity");
         String gst=request.getParameter("gst");
         String peramount=request.getParameter("peramount");
         String discount=request.getParameter("discount");
         String frame=request.getParameter("frame_no");
         int amount=Integer.parseInt(peramount);
         int quan=Integer.parseInt(quantity);
         int gt=Integer.parseInt(gst);
         int dis=Integer.parseInt(discount);
         int d=amount/(100/dis);
         int g=amount/(100/gt);
        int total=amount+g-d;
        int left=qua-quan;
        int total1=total*quan;
        if(quan<qua)
        {
        boolean i=st2.execute("insert into customer_cycle_bill(bill_id,cycle_id,gst,quantity,per_amount,discount,total,frame_no)values('"+data+"','"+cycle+"','"+gst+"','"+quantity+"','"+peramount+"','"+discount+"','"+total1+"','"+frame+"')");
          st4.execute("update cycle SET quantity="+left+" where cycle_id= '"+cycle+"'");
        out.print("<script>alert(\"cycle added and now left quantity is "+left+"\")</script>");
        response.sendRedirect("Bill.jsp");
     
        }
        else{
           out.print("<script>alert(\"Quantity is less and left quantity is only "+qua+" \")</script>");
           response.sendRedirect("Bill.jsp");
        }
     }
     
%>   
    </body>
</html>
