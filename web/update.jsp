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
<%!

String id,bill;
int qua,amount,dis,quan;
%>
<%
             Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
               id =request.getParameter("cid");
               String sql1="select quantity from cycle where cycle_id='"+id+"'";
                bill=(String)session.getAttribute("bill_id");
               Statement st1=con.createStatement();
               ResultSet rs1=st1.executeQuery(sql1);
               while(rs1.next())
               {
                 quan=rs1.getInt("quantity");
               }
               System.out.println("Cycle id is on update form page \t "+id);
              String sql="select * from customer_cycle_bill where cycle_id= '"+id+"' and  bill_id='"+bill+"'";
              ResultSet rs=st.executeQuery(sql);
       
                while(rs.next())
                {
                    qua=rs.getInt("quantity");
                    amount=rs.getInt("per_amount");
                    dis=rs.getInt("discount");
                }
              %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    
    <body>
        <form action="updateCycleBill.jsp" method="get">
            <table>
                <tr><th colspan="2"><h1>Update Product</h1></tr>
                <tr><td> <input type="hidden" name="cycle_id" value="<%=id%>"><input type="hidden" name="bill_id" value="<%=bill%>"></td></tr>
                <tr><th>Present Quantity</th><td><input type="text" name="quantity1" value="<%=quan%>" readonly=""></td></tr>
                
                <tr><th>Enter Quantity</th><td><input type="text" name="quantity" value="<%=qua%>"></td></tr>
                <tr><th>Enter per Amount</th><td><input type="text" name="peramount" value="<%=amount%>" ></td></tr>
                <tr><th>Enter Discount</th><td><input type="text" name="discount" value="<%=dis%>"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit"></td></tr>
            </table>
        </form>
      
    </body>
</html>
