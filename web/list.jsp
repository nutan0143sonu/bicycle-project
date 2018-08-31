
<%@ page import="java.sql.*" %>  
<%  
    Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
    
    
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
out.print("<p>Please enter name!</p>");  
}else{  
try{  
         String sql="select company.company_name,color.color_name,cycle_model.model_name,cycle_frame.frame_size,cycle_frame.type from cycle INNER JOIN Company ON company.company_id=cycle.company_id INNER JOIN color ON color.color_id=cycle.color_id INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id where cycle_model.model_name like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<form method='post'>");
                out.print("<table border='1' cellpadding='2' width='100%'>");  
                out.print("<tr><th>model_name</th><th>frame_size</th><th>company_name</th><th>color_name</th><th>Type</th><th>Enter Frame No.</th><th>quantity</th><th>gst</th><th>per_amount</th>discount</th><th>total</th></tr>");  
                while(rs.next()){
                    //String fullname=rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5);
                   // String address=rs.getString(14)+" "+rs.getString(15)+" "+rs.getString(16)+" "+rs.getString(17)+" "+rs.getString(19);
//out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>");  
out.print("<tr><td>"+rs.getString("cycle_model.model_name")+"</td><td>"+rs.getString("cycle_frame.frame_size") +"</td><td>"+rs.getString("company.company_name")+"</td><td>"+rs.getString("color.color_name")+"</td><td>"+rs.getString("cycle_frame.type")+"</td><td><input type=\"text\"></td><td><input type=\"text\"></td><td><input type=\"text\"></td><td><input type=\"text\"></td><td></td><td><input type=\"submit\" name=\"submit\"></td></tr>");  
}  
out.print("</table>");
out.print("</form>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
