
<%@ page import="java.sql.*" %>  
<%
    out.print("<br>");
    Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
    Statement st1=con.createStatement();
      Statement st2=con.createStatement();
       Statement st3=con.createStatement();
    
String name=request.getParameter("val1");
if(name==null||name.trim().equals("")){  
  
}else{  
try{  
         String sql="select parts.quantity,parts.part_id,part_name.part_name,parts.size,parts.type,color.color_name,company.company_name from parts INNER JOIN part_name on part_name.part_name_id=parts.part_name_id  INNER JOIN company on company.company_id=parts.company_id INNER JOIN color on color.color_id=parts.color_id where part_name.part_name like '"+name+"%' or company.company_name like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table border='1'  width=\"1098\">");  
                out.print("<tr><th  width=\"122\">part_id</th><th  width=\"122\">Part Name</th><th  width=\"122\">Size</th><th  width=\"122\">Company</th><th  width=\"122\">Type</th><th  width=\"122\">Color</th><th  width=\"122\">Available Quantity</th><th  width=\"122\">Request Quantity</th><th  width=\"122\">ADD Button</th></tr>");  
                 out.print("</table>");
                while(rs.next()){
                   // String part_id=rs.getString("parts.part_id");
                  out.print("<form action=\"addpartRequest.jsp\" method=\"post\">");
                  out.print("<table border='1' width=\"1098\">");
out.print("<tr><td  width=\"122\"><input type\"text\" name=\"part\" value=\""+rs.getString("parts.part_id")+"\" style=\"width:120px;\" readonly></td><td  width=\"122\">"+rs.getString("part_name.part_name") +"</td><td  width=\"122\">"+rs.getString("parts.size")+"</td><td  width=\"122\">"+rs.getString("company.company_name")+"</td><td  width=\"122\">"+rs.getString("parts.type")+"</td><td  width=\"122\">"+rs.getString("color.color_name")+"</td><td  width=\"122\">"+rs.getString("parts.quantity")+"</td><td  width=\"122\"><input type=\"text\" name=\"quantity\" style=\"width:120px;\"></td><td  width=\"122\"><input type=\"submit\" name=\"submit\" value=\"ADD\" style=\"width:120px;\"></td></tr>");  
out.print("</table>");
out.print("</form>");
}  


}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
