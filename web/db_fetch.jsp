<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%!
String mid;
%>
<%
            response.setContentType("text/xml");
            String sn=request.getParameter("ok");
            System.out.println("company id\t"+sn);
           // int i=Integer.parseInt(sn);
 
                   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
   /* Statement st=con.createStatement();
    
    String sql="select company_id from company where company_name= '" +sn +"'";
                    ResultSet rs = st.executeQuery(sql);
 while(rs.next())
 {
      mid=rs.getString(1);
 }*/
     Statement st1=con.createStatement();
   String sql1="select cycle_model.model_id,cycle_model.model_name from cycle INNER JOIN cycle_model ON cycle.model_id=cycle_model.model_id where company_id= '" +sn +"'";
                    
                    ResultSet rs1 = st1.executeQuery(sql1);
                    out.println("<emp>");
                    while(rs1.next())
                    {                            
                        out.println("<empname>"+rs1.getString(2)+"</empname>");
 
                    }
                    out.println("</emp>");
 

st1.close();
con.close();
 
%>