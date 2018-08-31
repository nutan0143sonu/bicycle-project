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
out.print("<p>Please enter part name!</p>");  
}else{  
try{  
         //String sql="select * from supplier where fname  like '"+name+"%' or lname  like '"+name+"%' or gst_no like '"+name+"%' or farm_name like '"+name+"%' or mname like '"+name+"%'";
           String sql=" select parts.part_id,part_name.part_name,parts.size,company.company_name,color.color_name,parts.type,parts.quantity,parts.gst,parts.per_amount,parts.discount, parts.status,parts.another_feature from parts INNER JOIN  company ON company.company_id=parts.company_id INNER JOIN color ON color.color_id=parts.color_id INNER JOIN part_name ON  part_name.part_name_id=parts.part_name_id where parts.part_id  like '"+name+"%' or part_name.part_name  like '"+name+"%' or company.company_name  like '"+name+"%'  or parts.size  like '"+name+"%' or parts.type  like '"+name+"%' or color.color_name  like '"+name+"%'or parts.another_feature  like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table style=\"border:1px solid red; background-image:url(image/63.jpg);\"   cellpadding='2' width='100%'>");  
                out.print("<tr><th height=\"30px\" style=\"border:1px solid red;\"><h2>part_id</h1></th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Part_name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>part Size</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Company Name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Color Name</th><th height=-\"30px\" style=\"border:1px solid red;\"><h2>Type</h2></th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Quantity</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Gst Percent</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Per Amount</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Discount</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>status</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Type of Parts</th></tr>");  
                while(rs.next()){
                  String gst=rs.getString("parts.gst")+"%";
                  String discount=rs.getString("parts.discount")+"%";
out.print("<tr><td height=\"30px\" style=\"border:1px solid red;\"><h4> "+rs.getString("parts.part_id")+"</h4></td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("part_name.part_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.size")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("company.company_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("color.color_name")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.type")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.quantity")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+gst+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.per_amount")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+discount+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.status")+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString("parts.another_feature")+"</td></tr>");  
}  
out.print("</table>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
