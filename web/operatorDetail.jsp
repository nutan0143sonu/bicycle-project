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
         String sql="select * from operator where user_id  like '"+name+"%' or fname  like '"+name+"%' or lname  like '"+name+"%' or email like '"+name+"%'";
         ResultSet rs=st.executeQuery(sql);  
  
          if(!rs.isBeforeFirst()) {      
          out.println("<p>No Record Found!</p>");   
           }         
          else{  
                out.print("<table border='1' cellpadding='2' width='100%' height='100%'>");  
                out.print("<tr><th>User_Id</th><th>Name</th><th>email</th><th>mobile_no1.</th><th>mobile_no2.</th><th>gender</th><th>Qualification</th><th>Address</th><th>pincode</th></tr>");  
                while(rs.next()){
                    String fullname=rs.getString(2)+" "+rs.getString(3);
                    String address=rs.getString(10)+" "+rs.getString(11)+" "+rs.getString(12)+" "+rs.getString(14)+" "+rs.getString(15);
//out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>");  
out.print("<tr><td>"+rs.getString(1)+"</td><td>"+fullname+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(8)+"</td><td>"+address+"</td><td>"+rs.getString(13)+"</td></tr>");  
}  
out.print("</table>");

}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}

%>
