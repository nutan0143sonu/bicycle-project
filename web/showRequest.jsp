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
        <title>REQUEST TABLE</title>
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
              String sql="select request_id from request order by timestamp desc limit 1";
              ResultSet rs=st.executeQuery(sql);
             
              if(rs.next())
              {
                  data=rs.getString(1);
              }
              session.setAttribute("request_id",data);
              String sql1="select * from request_product where request_id= '"+data+"'";
              ResultSet rs1=st1.executeQuery(sql1);
              out.print("<table border=\"1\" width=\"900\" >");
              out.print("<tr><th colspan=\"3\">Request ID</th><th colspan=\"11\">"+data+"</th></tr>");
              out.print("<tr><th width=\"100\">Type Product</th><th width=\"100\">Product Name</th><th width=\"100\">Frame Size</th><th width=\"100\">Company</th><th width=\"100\">Type</th><th width=\"100\">color</th><th width=\"100\">Quantity</th><th width=\"100\">Delete Product</th><th width=\"100\">Update Product</th></tr>");
              out.print("</table>");
              while(rs1.next())
              {   cycle_id=rs1.getString("cycle_id");
                  
                  System.out.println("cycle id on show Request Page \t"+cycle_id);
                  String quantity=rs1.getString("cycle_quantity");
                  String sql2="select cycle_model.model_name,company.company_name,cycle_frame.frame_size,cycle_frame.type,color.color_name from cycle INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id INNER JOIN company ON company.company_id=cycle.company_id INNER JOIN color ON color.color_id=cycle.color_id where cycle.cycle_id= '"+cycle_id+"'";
                  ResultSet rs2=st2.executeQuery(sql2);
                  while(rs2.next())
                  {
                    out.print("<table border=\"1\" width=\"900\">");
                    out.print("<tr><td width=\"100\">cycle</td><td width=\"100\">"+rs2.getString("cycle_model.model_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.frame_size")+"</td><td width=\"100\">"+rs2.getString("company.company_name")+"</td><td width=\"100\">"+rs2.getString("cycle_frame.type")+"</td><td width=\"100\">"+rs2.getString("color.color_name")+"</td><td width=\"100\">"+quantity+"</td><td width=\"100\"><a href=\"deleteCycleRequest.jsp?cycle_id="+cycle_id+"\">Delete</a></td><td width=\"100\"><a href=\"updateCycleRequest.jsp?cycleid="+cycle_id+"\">Update</a></td></tr>");
                    out.print("</table>");
                    
                  }
              }
              
          String sql3="select * from request_part where request_id= '"+data+"'";
              ResultSet rs3=st3.executeQuery(sql3);
             while(rs3.next())
              {
                 
                  part_id=rs3.getString("part_id");
                 System.out.println("part id on show request table"+part_id);
                  String sql4="select parts.another_feature,part_name.part_name,company.company_name,color.color_name,parts.size,parts.type from parts INNER JOIN part_name ON part_name.part_name_id=parts.part_name_id INNER JOIN company ON company.company_id=parts.company_id INNER JOIN color ON color.color_id=parts.color_id where parts.part_id= '"+part_id+"'" ;   
                  ResultSet rs4=st4.executeQuery(sql4);
                  while(rs4.next())
                  {  
                     out.print("<table border=\"1\" width=\"900\">");
                    out.print("<tr><td width=\"100\">part</td><td width=\"100\">"+rs4.getString("part_name.part_name")+"</td><td width=\"100\">"+rs4.getString("parts.size")+"</td><td width=\"100\">"+rs4.getString("company.company_name")+"</td><td width=\"100\">"+rs4.getString("parts.type")+"</td><td width=\"100\"> "+rs4.getString("color.color_name")+"</td><td width=\"100\">"+rs3.getString("quantity")+"</td><td width=\"100\"><a href=\"deletePartRequest.jsp?id=" +part_id+ "\">Delete</a></td><td width=\"100\"><a href=\"updatePartRequest.jsp?partid=" +part_id+ "\">Update</a></td></tr>");
                    out.print("</table>");
                    
                  }
              } 
        %>  
    </body>
</html>
