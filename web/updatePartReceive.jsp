<%-- 
    Document   : updateCycleReceive
    Created on : Apr 26, 2018, 8:19:12 PM
    Author     : Nutan Gupta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Cycle Receive Page</title>
    </head>
    <body>
           <%!
        String qu ,requantity,gst,request_quantity;
        int qua,requantity1,gst1,request_quantity1;
        String request_id,id,receive_id;
      %>
        <%   
                            
             try{
            if(request.getParameter("submit")!=null)
             {
             Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
              Statement st=con.createStatement();
              Statement st3=con.createStatement();
              Statement st2=con.createStatement();
              Statement st4=con.createStatement();
              Statement st5=con.createStatement();
           
           
                id =request.getParameter("part_id");
               System.out.println("part_id on update part receive \t"+id);
                 receive_id =request.getParameter("receive_id");
                 System.out.println("receive id on update part receive \t"+receive_id);
                String sql5="select request_id from receive where receive_id='"+receive_id+"'";
                Statement st6=con.createStatement();
                ResultSet rs6=st6.executeQuery(sql5);
                if(rs6.next())
                {
                    request_id=rs6.getString("request_id");
                   System.out.println(request_id);
                }
               String sql="select * from receive_part where part_id= '"+id+"' and receive_id='"+receive_id+"'";
              ResultSet rs=st.executeQuery(sql);
              if(rs.next())
              {
                     requantity1=rs.getInt("receive_quantity");
                     System.out.println("rquantity\t"+requantity1);
                     gst1=rs.getInt(5);
                     System.out.println("gst\t"+gst1);
              }
              
              String quantity=request.getParameter("quantity");
        
        
         String peramount=request.getParameter("peramount");
         String discount=request.getParameter("discount");
           
         String sql3="select quantity from parts where part_id = '"+id+"' ";
         System.out.println(sql3);
         ResultSet rs3=st3.executeQuery(sql3);
             System.out.println(rs3);
        if(rs3.next())
        {
           qua=rs3.getInt("quantity");
           System.out.println("parts table quantity\t"+qua);
         
        }
        qua=qua-requantity1;
        System.out.println("after subtracting receive quantity parts table quantity\t"+qua);
         int amount=Integer.parseInt(peramount);
         int quan=Integer.parseInt(quantity);
         System.out.println("inserted quantity\t"+quan);
         int dis=Integer.parseInt(discount);
          double d=amount/(100/dis);
          System.out.println("percentage discount\t"+d);
          double g=amount/(100/gst1);
          System.out.println("percentage gst\t"+g);
          double t=amount+g-d;
          System.out.println("per toyal\t"+t);
          double total=t*quan;
          System.out.println("grand total\t"+total);
            
           
               String sql7="select quantity from request_part where request_id='"+request_id+"' and part_id='"+id+"'";
               System.out.println(sql7);
               Statement s=con.createStatement();
               ResultSet r=s.executeQuery(sql7);
               if(r.next())
               {
                     request_quantity1=r.getInt("quantity");
                     System.out.println("requested quantity\t"+request_quantity1);
               }
               int left;
               qua=qua+quan;
               System.out.println("new quantity in table\t"+qua);
               Statement stt=con.createStatement();
           boolean j=   stt.execute("update parts set quantity='"+qua+"' where part_id='"+id+"'");
            System.out.print("update parts set quantity='"+qua+"' where part_id='"+id+"'");
            if(request_quantity1>quan)
               {
                  
                   
                   left=request_quantity1-quan;
                   System.out.println("left quantity\t"+left);
                   
                   st3.execute("update receive_part set receive_quantity="+quan+",left_quantity="+left+",discount="+discount+",per_amount="+amount+",total="+total+" where part_id='"+id+"'");
                   out.print("<script>alert(\"data is updated\")</script>");
               }
               else
               {
                left=0;
                System.out.println("left quantity\t"+left);
                boolean i=st3.execute("update receive_part set receive_quantity="+quan+", left_quantity="+left+", discount="+discount+", per_amount="+amount+", total="+total+" where part_id='"+id+"'");
                System.out.println(i);
                out.print("<script>alert(\"data is updated\")</script>");
               }
              
             }
               response.sendRedirect("Receive_product.jsp");
             }catch(Exception e){System.out.println(e);}
        %>
        
    </body>
</html>
