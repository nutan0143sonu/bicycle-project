<%-- 
    Document   : receive
    Created on : Apr 15, 2018, 2:14:24 PM
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
        <title>Receive Page</title>
    </head>
    <body>
        <%!
          String data;
          String request1;
          String q;
          int q1;
        %>
        <%
          Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
           Statement st=con.createStatement();
           String sql="select receive_id,request_id from receive order by timestamp desc limit 1";
           ResultSet rs=st.executeQuery(sql);
           if(rs.next())
           {
              data=rs.getString("receive_id");
             request1=rs.getString("request_id");
             
           }
           session.setAttribute("receive_id", data);
           String sql1="select * from request_product where request_id='"+request1+"'";
           String sql2="select * from request_part where request_id='"+request1+"'";
           Statement st1=con.createStatement();
           ResultSet rs1=st1.executeQuery(sql1);
           Statement st4=con.createStatement();
           ResultSet rs4=st4.executeQuery(sql2);
           out.print("<br>");
           
           out.print("<table border=\"1\" width=\"1300\">");
           out.println("<tr><th width=\"100\">Type of Product</th><th width=\"100\">Product_id</th><th width=\"100\">Product Name</th><th width=\"100\">Size</th><th width=\"100\">company</th><th width=\"100\">Type</th><th width=\"100\">color</th><th width=\"100\">Requested quantity</th><th width=\"100\">Receive Quantity</th><th width=\"100\">GST</th><th width=\"100\">Per Amount</th><th width=\"100\">Discount</th><th width=\"100\">ADD Button</th></tr>");
          out.print("</table>");
           while(rs1.next())
           {
               //requested product
                q=rs1.getString("cycle_quantity");
                q1=(Integer.parseInt(q));
               String cycle_id=rs1.getString("cycle_id");
               
               String sql3="select cycle.cycle_id,cycle_model.model_name,cycle_frame.frame_size,company.company_name,color.color_name,cycle_frame.type,cycle.quantity,cycle.gst,cycle.per_amount,cycle.discount from cycle INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN company ON company.company_id=cycle.company_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id INNER JOIN color ON color.color_id=cycle.color_id where cycle.cycle_id='"+cycle_id+"'";
               Statement st3=con.createStatement();
               ResultSet rs3=st3.executeQuery(sql3);
               //checking that cycle_id is present in receive table or not
               String sql5="Select * from receive_cycle where cycle_id='"+cycle_id+"' and receive_id='"+data+"'";
               Statement st5=con.createStatement();
               ResultSet rs5=st5.executeQuery(sql5);
               if(rs5.next())
               {
                continue;
               }
               else
               {
               while(rs3.next()){
                    out.print("<form action=\"addReceiveCycle.jsp\" method=\"post\">");
                out.print("<table border=\"1\" width=\"1300\">");
                   out.print("<tr><td width=\"100\">cycle</td><td width=\"100\"><input type=\"text\" name=\"cycle\" value=\""+cycle_id+"\" readonly style=\"width:100px;\"></td><td width=\"100\">"+rs3.getString("cycle_model.model_name")+"</td><td width=\"100\">"+rs3.getString("cycle_frame.frame_size")+"</td><td width=\"100\">"+rs3.getString("company.company_name")+"</td><td width=\"100\">"+rs3.getString("cycle_frame.type")+"</td><td width=\"100\">"+rs3.getString("color.color_name")+"</td><td width=\"100\"><input type=\"text\" name=\"quantity\" value=\""+rs1.getString("cycle_quantity")+"\" style=\"width:100px;\" readonly></td><td width=\"100\"><input type=\"text\" name=\"requantity\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"gst\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"peramount\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"discount\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"submit\" name=\"submit\" value=\"add Button\"style=\"width:100px;\"></td></tr>");
                 out.print("</table>");
                 out.print("</form>");
               }   
               
               }
           }
           
           while(rs4.next())
           {
               String part_id=rs4.getString("part_id");
               String sql6=" select parts.part_id,part_name.part_name,parts.size,company.company_name,color.color_name,parts.type,parts.quantity,parts.gst,parts.per_amount,parts.discount, parts.status,parts.another_feature from parts INNER JOIN  company ON company.company_id=parts.company_id INNER JOIN color ON color.color_id=parts.color_id INNER JOIN part_name ON  part_name.part_name_id=parts.part_name_id where parts.part_id ='"+part_id+"'";
               Statement st5=con.createStatement();
               ResultSet rs5=st5.executeQuery(sql6);
               //checking
               String sql7="select * from receive_part where part_id='"+part_id+"' and receive_id='"+data+"'";
               Statement st7=con.createStatement();
               ResultSet rs7=st7.executeQuery(sql7);
               if(rs7.next())
               {
                  continue;
               }
               else
               {
               while(rs5.next()){
                 out.print("<form action=\"addReceivePart.jsp\" method=\"post\">");
                 out.print("<table border=\"1\" width=\"1300\">");
               out.print("<tr><td width=\"100\">Part</td><td width=\"100\"><input type=\"text\" name=\"part\" value=\""+part_id+"\" readonly style=\"width:100px;\"></td><td width=\"100\">"+rs5.getString("part_name.part_name")+"</td><td width=\"100\">"+rs5.getString("parts.size")+"</td><td width=\"100\">"+rs5.getString("company.company_name")+"</td><td width=\"100\">"+rs5.getString("parts.type")+"</td><td width=\"100\">"+rs5.getString("color.color_name")+"</td><td width=\"100\"><input type=\"text\" name=\"quantity\" value=\""+rs4.getString("quantity")+"\" style=\"width:100px;\" readonly></td><td width=\"100\"><input type=\"text\" name=\"requantity\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"gst\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"peramount\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"text\" name=\"discount\" style=\"width:100px;\"></td><td width=\"100\"><input type=\"submit\" name=\"submit1\" value=\"add Button\"style=\"width:100px;\"></td></tr>");
              out.print("</table>");
           out.print("</form>");
               }
               }
           }
           
        %>  

  </body>
</html>
