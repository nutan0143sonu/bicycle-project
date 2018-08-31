<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%!

String fid;
%>
<%
            response.setContentType("text/xml");
            String sn=request.getParameter("ok");
            String sn1=request.getParameter("ok1");
            System.out.println("frame id  is\t"+sn+"type of cycle"+sn1);
           
// int i=Integer.parseInt(sn);
 
                   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
    Statement st=con.createStatement();
    Statement st1=con.createStatement();
    
   
     String sql="select model_id from cycle_model where model_name='"+sn1+"'";  
   // String sql="select company_id from company where company_name= '" +sn +"'";
                    ResultSet rs = st.executeQuery(sql);
 while(rs.next())
 {
      fid=rs.getString(1);
 }                    
           String sql1="select cycle.frame_id,cycle_frame.frame_size,cycle_frame.type from cycle INNER JOIN cycle_frame ON cycle.frame_id=cycle_frame.frame_id where cycle.company_id='"+sn+"' and cycle.model_id='"+fid+"'";         
                    ResultSet rs1 = st.executeQuery(sql);
                    
 
                    out.println("<emp>");
                    while(rs1.next())
                    {                            
                        out.println("<empname>"+rs1.getString(2)+" "+rs1.getString(3)+"</empname>");
 
                    }
                    out.println("</emp>");
 
rs1.close();
st.close();
con.close();
 
%>