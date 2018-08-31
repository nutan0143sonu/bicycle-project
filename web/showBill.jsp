<%-- 
    Document   : showBill
    Created on : Apr 13, 2018, 9:06:18 AM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BILL TABLE</title>
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
  String cycle_id;
  String part_id;
   %>
        <%
              out.print("<br>");
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st1=con.createStatement();
              Statement st2=con.createStatement();
              Statement st3=con.createStatement();
              Statement st4=con.createStatement();
              String sql="select bill_id from bill order by timestamp desc limit 1";
              ResultSet rs=st.executeQuery(sql);
              double grand=0.0;
              if(rs.next())
              {
                  data=rs.getString(1);
              }
              session.setAttribute("bill_id", data);
              String sql1="select * from customer_cycle_bill where bill_id= '"+data+"'";
              ResultSet rs1=st1.executeQuery(sql1);
              out.print("<table border=\"1\" width=\"1400\" >");
              out.print("<tr><th colspan=\"3\">BILL ID</th><th colspan=\"11\">"+data+"</th></tr>");
              out.print("<tr><th width=\"100\">Type Product</th><th width=\"100\">frame_no</th><th width=\"100\">Product Name</th><th width=\"100\">Frame Size</th><th width=\"100\">Company</th><th width=\"100\">Type</th><th width=\"100\">color</th><th width=\"100\">Quantity</th><th width=\"100\">gst</th><th width=\"100\">Per Amount</th><th width=\"100\">Discount</th><th width=\"100\">Total</th><th width=\"100\">Delete Product</th><th width=\"100\">Update Product</th></tr>");
              out.print("</table>");
              while(rs1.next())
              {
                  cycle_id=rs1.getString("cycle_id");
                  String sql2="select cycle.quantity,cycle_model.model_name,company.company_name,cycle_frame.frame_size,cycle_frame.type,color.color_name from cycle INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id INNER JOIN company ON company.company_id=cycle.company_id INNER JOIN color ON color.color_id=cycle.color_id where cycle.cycle_id= '"+cycle_id+"'";
                  ResultSet rs2=st2.executeQuery(sql2);
                  while(rs2.next())
                  {
                      String g=rs1.getString("total");
                      double g1=Double.parseDouble(g);
                    out.print("<table border=\"1\" width=\"1400\">");
                    //session.setAttribute("cycleid", cycle_id);
                    
                   out.print("<tr><td width=\"100\">cycle</td><td width=\"100\">"+rs1.getString("frame_no")+"</td><td width=\"100\">"+rs2.getString("cycle_model.model_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.frame_size")+"</td><td width=\"100\">"+rs2.getString("company.company_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.type")+"</td><td width=\"100\">"+rs2.getString("color.color_name")+"</td><td width=\"100\">"+rs1.getString("quantity")+"</td><td width=\"100\">"+rs1.getString("gst")+"</td><td width=\"100\">"+rs1.getString("per_amount")+"</td><td width=\"100\">"+rs1.getString("discount")+"</td><td width=\"100\">"+rs1.getString("total")+"</td><td width=\"100\"><a href=\"delete.jsp?id=" +cycle_id+ "\">Delete</a></td><td width=\"100\"><a href=\"update.jsp?cid="+cycle_id+"\">Update</a></td></tr>");
                   out.print("</table>"); 
                   grand=grand+g1;
                  }
              }
              
          String sql3="select * from customer_part_bill where bill_id= '"+data+"'";
              ResultSet rs3=st3.executeQuery(sql3);
             while(rs3.next())
              {
                  part_id=rs3.getString("part_id");
                  System.out.println("part id on show bill page"+part_id);
                  String sql4="select parts.another_feature,part_name.part_name,company.company_name,color.color_name,parts.size,parts.type from parts INNER JOIN part_name ON part_name.part_name_id=parts.part_name_id INNER JOIN company ON company.company_id=parts.company_id INNER JOIN color ON color.color_id=parts.color_id where parts.part_id= '"+part_id+"'" ;   
                  ResultSet rs4=st4.executeQuery(sql4);
                  while(rs4.next())
                  {  
                      String g2=rs3.getString("total");
                      double g3=Double.parseDouble(g2);
                    out.print("<table border=\"1\" width=\"1400\">");
                    out.print("<tr><td width=\"100\">part</td><td width=\"100\">NAN</td><td width=\"100\">"+rs4.getString("part_name.part_name")+"</td><td width=\"100\">"+rs4.getString("parts.size")+"</td><td width=\"100\">"+rs4.getString("company.company_name")+"</td><td width=\"100\">"+rs4.getString("parts.type")+"</td><td width=\"100\"> "+rs4.getString("color.color_name")+"</td><td width=\"100\">"+rs3.getString("quantity")+"</td><td width=\"100\">"+rs3.getString("gst")+"</td><td width=\"100\">"+rs3.getString("per_amount")+"</td><td width=\"100\">"+rs3.getString("discount")+"</td><td width=\"100\">"+rs3.getString("total")+"</td><td width=\"100\"><a href=\"deletepart.jsp?id=" +part_id+ "\">Delete</a></td><td width=\"100\"><a href=\"updatepart.jsp?partid=" +part_id+ "\">Update</a></td></tr>");
                     out.print("</table>");
                    grand=grand+g3;
                  }
              } 
        out.print("<table border=\"1\" width=\"1400\">");
        out.print("<tr><th width=\"100\" colspan=\"11\">Grand Total</th><td width=\"100\" colspan=\"3\">"+grand+"</td></tr>");
        out.print("</table>");
        %>  
    </body>
</html>
