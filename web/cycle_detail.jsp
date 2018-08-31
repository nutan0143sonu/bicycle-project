<%!
String  uid;
%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>

<%@ page import="java.sql.*" %>  
<%  
    Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
    
    
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
out.print("<p>Please enter cycle name!</p>");  
}else{  
try{  
         //String sql="select * from supplier where fname  like '"+name+"%' or lname  like '"+name+"%' or gst_no like '"+name+"%' or farm_name like '"+name+"%' or mname like '"+name+"%'";
           String sql="select cycle.cycle_id,cycle_model.model_name,cycle_frame.frame_size,company.company_name,color.color_name,cycle_frame.type,cycle.quantity,cycle.gst,cycle.per_amount,cycle.discount from cycle INNER JOIN cycle_model ON cycle_model.model_id=cycle.model_id INNER JOIN company ON company.company_id=cycle.company_id INNER JOIN cycle_frame ON cycle_frame.frame_id=cycle.frame_id INNER JOIN color ON color.color_id=cycle.color_id where cycle_model.model_name  like '"+name+"%' or company.company_name  like '"+name+"%' or cycle_frame.frame_size  like '"+name+"%' or cycle_frame.type  like '"+name+"%' or color.color_name  like '"+name+"%' or cycle.cycle_id  like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table  style=\"border:1px solid red; background-image:url(image/63.jpg); \"   border='1' cellpadding='2' width='100%'>");  
                out.print("<tr><th height=\"30px\" style=\"border:1px solid red;\"><h2>Cycle_id</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Model_name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>frame Size</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Company Name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Color Name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Type</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Quantity</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Gst Percent</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Per Amount</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Discount</th></tr>");  
                while(rs.next()){
                  String gst=rs.getString("cycle.gst")+"%";
                  String discount=rs.getString("cycle.discount")+"%";
out.print("<tr><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle.cycle_id")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle_model.Model_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle_frame.frame_size")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("company.company_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("color.color_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle_frame.type")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle.quantity")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+gst+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("cycle.per_amount")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+discount+"</td></tr>");  
}  
out.print("</table>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
