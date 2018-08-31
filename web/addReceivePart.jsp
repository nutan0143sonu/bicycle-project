<%-- 
    Document   : addReceivePart
    Created on : Apr 16, 2018, 7:27:43 PM
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
        <title>Add Receive Part Page</title>
    </head>
    <body>
        <%!
           int quantity1;
           int requantity1;
           int qu;
           String gs,pe,di;
        %>
        
        <%
             String id =(String) session.getAttribute("receive_id");
            if(request.getParameter("submit1")!=null)
            {
                String cycle=request.getParameter("part");
             //out.print(cycle);
             String discount=request.getParameter("discount");
             String peramount=request.getParameter("peramount");
             String requantity=request.getParameter("requantity");
             String quantity=request.getParameter("quantity");
             String gst=request.getParameter("gst");
             requantity1=(Integer.parseInt(requantity)); 
             quantity1=(Integer.parseInt(quantity)); 
             int p=(Integer.parseInt(peramount));
             int d=(Integer.parseInt(discount));
             int g=(Integer.parseInt(gst));
             double d1=p/(100/d);
             double g1=p/(100/g);
             double total=p+g1-d1;
             double total1=total*requantity1;
             int left;
             if(requantity1>quantity1)
             {
                left=0;
             }
             else
             {
              left=quantity1-requantity1;
             }
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
             Statement st=con.createStatement();
             boolean i=st.execute("insert into receive_part(receive_id,part_id,receive_quantity,left_quantity,gst,discount,per_amount,total)values('"+id+"','"+cycle+"','"+requantity+"','"+left+"','"+gst+"','"+discount+"','"+peramount+"','"+total1+"')");
            
             String sql2="select quantity,gst,per_amount,discount from parts where part_id='"+cycle+"'";
             Statement st2=con.createStatement();
             ResultSet rs=st2.executeQuery(sql2);
             if(rs.next())
             {
               String quan=rs.getString("quantity");
               qu=(Integer.parseInt(quan));
               gs=rs.getString("gst");
               pe=rs.getString("per_amount");
               di=rs.getString("discount");
             }
             int qua=qu+requantity1;
             Statement st1=con.createStatement();
             st1.execute("update parts set quantity="+qua+",gst="+gst+",per_amount="+peramount+" where part_id='"+cycle+"'");
              out.print("<script>alert(\"data inserted and updated quantity is "+qua+"\")</script>");     
            response.sendRedirect("Receive_product.jsp");
            }
        %>
    </body>
</html>
