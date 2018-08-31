<%-- 
    Document   : showReceiveTable
    Created on : Apr 16, 2018, 8:03:01 PM
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
        <title>Show Receive Table Page</title>
    </head>
    <body>
        <%!
            String receive_id,cycle_id,part_id;
            double grand=0.0;
        %>
        <%
             out.print("<br>");  
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
             Statement st=con.createStatement();
             Statement st1=con.createStatement();
             Statement st2=con.createStatement();
             Statement st3=con.createStatement();
             String sql="select receive_id from receive order by timestamp desc limit 1";
             ResultSet rs=st.executeQuery(sql);
             if(rs.next())
             {
                 receive_id=rs.getString("receive_id");
             }
            session.setAttribute("receive_id", receive_id);
             String sql1="select * from receive_cycle where receive_id='"+receive_id+"'";
             String sql3="select * from receive_part where receive_id='"+receive_id+"'";
             ResultSet rs1=st1.executeQuery(sql1);
             ResultSet rs3=st3.executeQuery(sql3);
             out.print("<table border=\"1\" width=\"1300\" >");
                 out.print("<tr><th colspan=\"3\">Receive ID</th><th colspan=\"11\">"+receive_id+"</th></tr>");
                 out.print("<tr><th width=\"100\">Type Product</th><th width=\"100\">Product Name</th><th width=\"100\">Frame Size</th><th width=\"100\">Company</th><th width=\"100\">Type</th><th width=\"100\">color</th><th width=\"100\">Receive Quantity</th><th width=\"100\">Left Quantity</th><th width=\"100\">gst</th><th width=\"100\">discount</th><th width=\"100\">Per Amount</th><th width=\"100\">Total</th><th width=\"100\">Update Product</th></tr>");
                 out.print("</table>");
             while(rs1.next())
             {
                
                 cycle_id=rs1.getString("cycle_id");
                 String t1=rs1.getString("total");
                 String sql2="select cycle_model.model_name,company.company_name,cycle_frame.frame_size,cycle_frame.type,color.color_name from cycle INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id INNER JOIN company ON company.company_id=cycle.company_id INNER JOIN color ON color.color_id=cycle.color_id where cycle.cycle_id= '"+cycle_id+"'";
                 ResultSet rs2=st2.executeQuery(sql2);
                 while(rs2.next())
                 {   
                     out.print("<table border=\"1\" width=\"1300\">");
                        out.print("<tr><td width=\"100\">Cycle</td><td width=\"100\">"+rs2.getString("cycle_model.model_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.frame_size")+"</td><td width=\"100\">"+rs2.getString("company.company_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.type")+"</td><td width=\"100\">"+rs2.getString("color.color_name")+"</td><td width=\"100\">"+rs1.getString("receive_quantity")+"</td><td width=\"100\">"+rs1.getString("left_quantity")+"</td><td width=\"100\">"+rs1.getString("gst")+"</td><td width=\"100\">"+rs1.getString("discount")+"</td><td width=\"100\">"+rs1.getString("per_amount")+"</td><td width=\"100\">"+rs1.getString("total")+"</td><td width=\"100\"><a href=\"updateReceive.jsp?cycle_id="+cycle_id+"\">Update</a></td></tr>");
                      double t=(Double.parseDouble(t1));
                      grand=grand+t;
                        out.print("</table>");
                        
                 }
             }
             while(rs3.next())
             {
                
                 part_id=rs3.getString("part_id");
                 
                 
                 String t2=rs3.getString("total");
                   String sql5="select parts.another_feature,part_name.part_name,company.company_name,color.color_name,parts.size,parts.type from parts INNER JOIN part_name ON part_name.part_name_id=parts.part_name_id INNER JOIN company ON company.company_id=parts.company_id INNER JOIN color ON color.color_id=parts.color_id where parts.part_id= '"+part_id+"'" ;   
                    Statement st5=con.createStatement();
                   ResultSet rs5=st5.executeQuery(sql5);
                 while(rs5.next())
                 {   
                     out.print("<table border=\"1\" width=\"1300\">");
                        out.print("<tr><td width=\"100\">part</td><td width=\"100\">"+rs5.getString("part_name.part_name")+"</td><td width=\"100\">"+rs5.getString("parts.size")+"</td><td width=\"100\">"+rs5.getString("company.company_name")+"</td><td width=\"100\">"+rs5.getString("parts.type")+"</td><td width=\"100\">"+rs5.getString("color.color_name")+"</td><td width=\"100\">"+rs3.getString("receive_quantity")+"</td><td width=\"100\">"+rs3.getString("left_quantity")+"</td><td width=\"100\">"+rs3.getString("gst")+"</td><td width=\"100\">"+rs3.getString("discount")+"</td><td width=\"100\">"+rs3.getString("per_amount")+"</td><td width=\"100\">"+rs3.getString("total")+"</td><td width=\"100\"><a href=\"updateReceivePart.jsp?part_id="+part_id+"\">Update</a></tr>");
                        Double t3=(Double.parseDouble(t2));
                        grand=grand+t3;
                        out.print("</table>");
                        
                 }     
             }
             out.print("<table border=\"1\" width=\"1300\">");
             out.print("<tr><th width=\"1150\" colspan=\"11\">Grand Total</th><td width=\"100\" colspan=\"2\">"+grand+"</td></tr>");
             out.print("</table>");
             String sql7="select * from receive_total where receive_id='"+receive_id+"'";
             Statement st7=con.createStatement();
             Statement st8=con.createStatement();
             Statement st9=con.createStatement();
             ResultSet rs7=st7.executeQuery(sql7);
             String s1="select * from payment where receive_id='"+receive_id+"'";
             Statement st10=con.createStatement();
             ResultSet rs10=st10.executeQuery(sql7);
            
             if(!rs7.next())
             {
               boolean k=st8.execute("insert into receive_total(receive_id,total)values('"+receive_id+"','"+grand+"')");
             }
             else
             {
               boolean k=st9.execute("update receive_total set total='"+grand+"' where receive_id='"+receive_id+"'");
             }
             
        %>
    </body>
</html>
