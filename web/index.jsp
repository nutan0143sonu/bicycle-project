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
out.print("<p>Please enter name!</p>");  
}else{  
try{  
         String sql="select * from supplier where fname  like '"+name+"%' or lname  like '"+name+"%' or gst_no like '"+name+"%' or farm_name like '"+name+"%' or mname like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table border='1' cellpadding='2' width='100%' height='100%'>");  
                out.print("<tr><th height=\"30px\" style=\"border:1px solid red;\"><h2>Gst_No.</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Farm_name</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>email</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Owner_mobile_no.</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Manager_mobile_no.</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>shop_mobile_no.</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>ifsc_code</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>email</th>account_no</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>Address</th><th height=\"30px\" style=\"border:1px solid red;\"><h2>pincode</th></tr>");  
                while(rs.next()){
                    String fullname=rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5);
                    String address=rs.getString(14)+" "+rs.getString(15)+" "+rs.getString(16)+" "+rs.getString(17)+" "+rs.getString(19);
//out.print("<tr><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(1)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(2)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(3)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(4)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(5)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(6)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(7)+"</td></tr>");  
out.print("<tr><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(1)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+fullname+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(2)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(6)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(7)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(8)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(9)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(10)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(11)+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+address+"</td><td height=\"30px\" style=\"border:1px solid red;\"><h4>"+rs.getString(18)+"</td></tr>");  
}  
out.print("</table>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
