<%-- 
    Document   : updateCycleBill
    Created on : Apr 26, 2018, 12:05:17 PM
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
        <title>Update Cycle Bill</title>
    </head>
    <body>
        <%!
        String qu,bill;
        int qua;
        String id,peramount,discount;
      %>
        <%
             Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st3=con.createStatement();
              Statement st2=con.createStatement();
              Statement st4=con.createStatement();
              Statement st5=con.createStatement();
           
                id =request.getParameter("part_id");
                bill=request.getParameter("bill_id");
               System.out.println("Part id is \t "+id);
              String sql="select * from customer_part_bill where part_id= '"+id+"' and bill_id='"+bill+"'";
              System.out.println(sql);
              ResultSet rs=st.executeQuery(sql);
       
         String sql3="select quantity from parts where part_id = '"+id+"' ";
           System.out.println(sql3);
         ResultSet rs3=st3.executeQuery(sql3);
        if(rs3.next())
        {
           qu=rs3.getString("quantity");
         
         qua=Integer.parseInt(qu);
         System.out.println("quantity in parts table qua=\t  "+qua);
        }
               String quantity=request.getParameter("quantity");
                
          peramount=request.getParameter("peramount");
          
          discount=request.getParameter("discount");
           
         int amount=Integer.parseInt(peramount);
          System.out.println("peramount in textbox \t "+amount);
         int quan=Integer.parseInt(quantity);
         System.out.println("quantity of textbox quan=\t "+quan);
         int dis=Integer.parseInt(discount);
       System.out.println("discount in textbox \t "+dis);
        if(quan<qua)
        {
              while(rs.next())
              {   
                  String q1=rs.getString("quantity");
                  int q2=Integer.parseInt(q1);
                  System.out.println("quantity in customer part  bill table q2= \t "+q2);
                  String gst=rs.getString("gst");
                 
                  int gt=Integer.parseInt(gst);
                 
                   System.out.println("gst in customer part  bill table gt= \t "+gt);
                   int d=amount/(100/dis);
                    int g=amount/(100/gt);
                     int total=amount+g-d;
                      //int left=qua-quan;
                      int total1=total*quan;
                  
                   
                   String sql1="update customer_part_bill set quantity="+quan+",discount="+discount+",per_amount="+peramount+",total="+total1+" where part_id='"+id+"'  "; 
                     st2.execute(sql1);
                    try{
                     if(q2<quan)
                     {
                          int cqua=quan-q2;
                          System.out.println("quan-q2 cqua= \t "+cqua);
                          int cq=qua-cqua;
                          System.out.println("Now parts table quantity is cq= \t "+cq);
                         String sql2="update parts set quantity="+cq+" where part_id='"+id+"'";
                         st4.execute(sql2);
                     }
                     else
                     {
                         int cqua1=q2-quan;
                         System.out.println("q2-quan cqual= \t "+cqua1);
                         int cq1=cqua1+qua;
                         System.out.println("Now present quantity in parts table cql= \t "+cq1);
                         String sql5="update parts set quantity="+cq1+" where part_id='"+id+"'";
                         
                         st5.execute(sql5);
                     }
                    }catch(Exception e){out.println(e);}
              }
              out.print("<script>alert(\"Quantity is updated\");</script>");
           //response.sendRedirect("Bill.jsp");
        }
        else 
            out.print("<script>alert(\"Quantity is less in your shop "+qua+"\");</script>");
            response.sendRedirect("Bill.jsp");
            
            
        %>
    </body>
</html>
