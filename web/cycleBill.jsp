
<%@ page import="java.sql.*" %>
<%  
    out.println("<br>");
    Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
     Statement st1=con.createStatement();
      Statement st2=con.createStatement();
       Statement st3=con.createStatement();
String name=request.getParameter("val");
if(name==null||name.trim().equals("")){  
out.print("<p>Please enter name!</p>");  
}else{  
try{
    
         String sql="select cycle.quantity,cycle.cycle_id,cycle_model.model_name,cycle_frame.frame_size,cycle_frame.type,color.color_name,company.company_name from cycle INNER JOIN cycle_model on cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame on cycle_frame.frame_id=cycle.frame_id INNER JOIN company on company.company_id=cycle.company_id INNER JOIN color on color.color_id=cycle.color_id where cycle_model.model_name like '"+name+"%' or company.company_name like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table width=\"1586\" border=\"1\">");  
                out.print("<tr><th width=\"122\">cycle_id</th><th width=\"122\">model Name</th><th width=\"122\">frame Size</th><th width=\"122\">Company</th><th width=\"122\">Type</th><th width=\"122\">Color</th><th width=\"122\">Present Quantity</th><th width=\"122\">Frame Number</th><th width=\"122\">Quantity</th><th width=\"122\">Gst</th><th width=\"122\">Per Amount</th><th width=\"122\">Discount</th><th width=\"122\">ADD Button</th></tr>");  
                out.print("</table >");
                while(rs.next()){
                   // String cycle_id=rs.getString("cycle.cycle_id");
                     out.print("<form action=\"addcycle.jsp\" method=\"post\">");
                     out.print("<table width=\"1586\" border=\"1\">");
out.print("<tr><td width=\"122\"><input type\"text\" name=\"cycle\" value=\""+rs.getString("cycle.cycle_id")+"\" style=\"width:120px;\" readonly></td><td width=\"122\">"+rs.getString("cycle_model.model_name") +"</td><td width=\"122\">"+rs.getString("cycle_frame.frame_size")+"</td><td width=\"122\">"+rs.getString("company.company_name")+"</td><td width=\"122\">"+rs.getString("cycle_frame.type")+"</td><td width=\"122\">"+rs.getString("color.color_name")+"</td><td width=\"122\">"+rs.getString("cycle.quantity")+"</td><td width=\"122\"><input type=\"text\" name=\"frame_no\" style=\"width:120px;\"></td><td width=\"122\"><input type=\"text\" name=\"quantity\" style=\"width:120px;\"></td><td width=\"122\"><input type=\"text\" name=\"gst\" style=\"width:120px;\"></td><td width=\"122\"><input type=\"text\" name=\"peramount\" style=\"width:120px;\"></td><td width=\"122\"><input type=\"text\" name=\"discount\" style=\"width:120px;\"></td><td width=\"122\"><input type=\"submit\" name=\"submit\" value=\"ADD\" style=\"width:120px;\"></td></form></tr>");  
out.print("</table>");                
}


     
    
}//end of else for rs.isBeforeFirst       
con.close();  
}catch(Exception e){out.print(e);}  
     
}

%>
