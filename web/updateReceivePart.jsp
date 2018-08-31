<%-- 
    Document   : update
    Created on : Apr 13, 2018, 11:24:16 AM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
      <%!
        String id,receive_id;
        int qua,amount,discount;
        
      %>
        <%   
                            
             try{
             Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st3=con.createStatement();
              Statement st2=con.createStatement();
              Statement st4=con.createStatement();
              Statement st5=con.createStatement();
           
           
                id =request.getParameter("part_id");
               System.out.println("part id on update receive page\t"+id);
                 receive_id =(String)session.getAttribute("receive_id");
                 System.out.println("receive id on update receive page\t"+receive_id);
                
               String sql="select * from receive_part where part_id= '"+id+"' and receive_id='"+receive_id+"'";
               System.out.println(sql);
              ResultSet rs=st.executeQuery(sql);
              if(rs.next())
              {
                     qua=rs.getInt("receive_quantity");
                     System.out.println("receive quantiy in receive cycle table before updation \t"+qua);
                     amount=rs.getInt("per_amount");
                     System.out.println("per amount in receive cycle table\t"+amount);
                     discount=rs.getInt("discount");
                     System.out.println("discount in receive cycle table"+discount);
                     
              }
              
              
               
             }catch(Exception e){System.out.println(e);}
        %>
            <form  action="updatePartReceive.jsp" method="post">
            <table>
                <tr><th colspan="2"><h1>Update Product</h1></tr>
                <tr><td><input type="hidden" name="part_id" value="<%=id%>"></td></tr>
                <tr><td><input type="hidden" name="receive_id" value="<%=receive_id%>"></td></tr>
                <tr><th>Enter Quantity</th><td><input type="text" name="quantity" value="<%=qua%>"></td></tr>
                <tr><th>Enter per Amount</th><td><input type="text" name="peramount" value="<%=amount%>"></td></tr>
                <tr><th>Enter Discount</th><td><input type="text" name="discount" value="<%=discount%>"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit"></td></tr>
            </table>
        </form>

    </body>
</html>
