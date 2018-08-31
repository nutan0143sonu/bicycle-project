
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	
<title>PAYMENT HERE</title>
<style>
body{
   width:100%;
   height:100%;
   background:url(image/61.jpg);
   background-size:cover;
   font-family:sans-serif;  
}
*{
mergin:0px;
padding:0px;
}
#menu ul{
list-style:none
}
#menu ul li{
background-color:#4682B4;
border:1px solid white;
width:120px;
height:35px;
line-height:35px;
text-align:center;
float:left;
position:relative;
border-radius:10px;
}
#menu ul li a{
text-decoration:none;
color:white;
display:block;
}
#menu ul li a:hover{
background-color:#92C7C7;
border-radius:10px;
}
#menu ul ul{
position:absolute;
display:none;
}
#menu ul li:hover > ul{
display:block;
}
#menu ul ul ul{
margin-left:120px;
top:0px;
}


</style>
</head>

<body>
    
    
     <div style="position:absolute;left: 110px;right: 0;bottom: 0;top: 0;">
    
	<div id="menu">
	           <ul>
			        <li><a href="a_home.jsp">Home</a></li>
					<li><a href="#">Details </a>
                                             <ul>
					<li><a href="search.html">Supplier Detail</a></li>
					<li><a href="operatorDetail.html">Operator Detail</a></li>
					   </ul>
                                        </li>
                                        <li><a href="#">Product Detail </a>
                                             <ul>
					<li><a href="cycle_detail.html">Cycle Detail</a></li>
					<li><a href="partsDetail.html">Part Detail</a></li>
					   </ul>
                                        </li>
					<li><a href="#">Registration</a>
					<ul>
					<li><a href="Supplier_re.jsp">Supplier Registration</a></li>
					
                                        <li><a href="registration.jsp">Registration</a></li>
					</ul>
                                        </li>
                                        <li><a href="#">Accounts</a>
					<ul>
					<li><a href="RequestProduct.jsp">Request Product</a></li>
					<li><a href="Receive_product.jsp">Receive Registration</a></li>
                                        <li><a href="payment.jsp">Payment</a></li>
					</ul>
                                        </li>
					<li><a href="Bill.jsp">Billing</a></li>
                                        <li><a href="logout.jsp">LOG OUT</a></li>
                   </ul>	
			   </div>

			  </div>
    
    
    
    
	
<%!
String  uid;

%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>

   
     <div style="margin-top: 125px;margin-left: 100px;">
    <marquee><h1>PAYMENT HERE</h1></marquee>
   <div class="container">
   <div class="left"></div>
   <div class="right">
   <div class="middle">
      <form action="#" align="center">
	  <table>
	  <tr>
	     
		 <th>Enter Receive Id</th>
        </tr>		  
		<tr>
	        <td><input type="text" name="receive_id" placeholder="Receive Id" required></td>
		</tr>
                <tr><td><br></td></tr>
                <tr>
	              <th>Enter Amount Paid</th>
                </tr>		  
		<tr>
		  <td><input type="text" name="amount_paid" placeholder="Amount Paid" required></td>
		</tr>
                 <tr><td><br></td></tr>
                <tr>
	              <th>Click on check box for payment mode</th>
                </tr>		  
		<tr>
		  <td><input type="checkbox" name="payment_mode" id="cash" value="cash">Cash
                      <input type="checkbox" name="payment_mode" id="check" value="check">Check
                  </td>
		</tr>
                <tr><td><br></td></tr>
                <tr>
	              <th>Enter check Number</th>
                </tr>		  
		<tr>
		  <td><input type="text" name="check_no" id="check" placeholder="Enter check no."></td>
		</tr>
                <tr><td><br></td></tr>
                <tr>
		  <td><input type="submit" name="submit" value="Submit"></td>
		</tr>
                
                </div>
                
</body>

</html>
<%
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("mysql loaded");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
        System.out.println("connection created");
        Statement st=con.createStatement();
        System.out.println("statement created");
        if(request.getParameter("submit")!=null)
        {
        String receive=request.getParameter("receive_id");
        System.out.println("received id"+receive);
        String amount_paid=request.getParameter("amount_paid");
        System.out.println("amount paid"+amount_paid);
        String payment_mode=request.getParameter("payment_mode");
        System.out.println("payment mode"+payment_mode);
        String check_no=request.getParameter("check_no");
        System.out.println("check number"+check_no);
        
        String sql="select * from receive where receive_id='"+receive+"'";
        System.out.println(sql);
        String sql1="select * from receive_total where receive_id='"+receive+"'";
        System.out.println(sql1);
        ResultSet rs=st.executeQuery(sql);
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery(sql1);
        String request_id="";
        while(rs.next())
        {
            request_id=rs.getString("request_id");
            System.out.println(request_id);
        }
           String sql3="select gst_no from request where request_id='"+request_id+"'";
           System.out.println(sql3);
           Statement st3=con.createStatement();
           ResultSet rs3=st3.executeQuery(sql3);
           String gst_no="";
           java.util.Date dt = new java.util.Date();
          
         java.text.SimpleDateFormat sdf = 
         new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

          String currentTime = sdf.format(dt);
   
           while(rs3.next())
           {
              gst_no=rs3.getString("gst_no");
              System.out.println("Gst number"+gst_no);
           }
           Double total=0.0;
           if(rs1.next())
           {
              total=rs1.getDouble("total");
              System.out.println("total is"+total);
           }
           else
           {
              out.print("<script>alert(\"This receive id is not present\")</script>");
           }
           Double amount_paid1=Double.parseDouble(amount_paid);
           System.out.println("amount paid after conversion"+amount_paid1);
           //left amount
           Double amount_pending=total-amount_paid1;
           String sql4="select payment_id from payment order by timestamp desc limit 1";
           System.out.println(sql4);
           Statement st4=con.createStatement();
           ResultSet rs4=st4.executeQuery(sql4);
           String paymentid="";
           String rowid="";
           
                    
                int newid1=0;
              
                if(rs4.next())
                  {
                       System.out.println("hello");
                     paymentid=rs4.getString("payment_id");
                     System.out.println("payment id before increment"+paymentid);
                     String id=paymentid.substring(7,paymentid.length());
                      newid1=(Integer.parseInt(id));
                     ++newid1;
                    rowid="payment"+newid1;
                    System.out.println("payment id after increemnt"+rowid);
                    
                  }
                Statement s=con.createStatement();
                     Statement s1=con.createStatement();
                   if(amount_paid1<=total)
                   {
                     boolean i=s.execute("insert into payment(payment_id,receive_id,gst_no,amount_paid,amount_pending,payment_mode,check_no,timestamp)values('"+rowid+"','"+receive+"','"+gst_no+"','"+amount_paid+"','"+amount_pending+"','"+payment_mode+"','"+check_no+"','"+currentTime+"')");
                     System.out.println(i);
                   boolean j=s1.execute("update  receive_total set total="+amount_pending+"");
                   System.out.println(j);
                    out.print("<script>alert(\"Payment Successful\")</script>");
                  }
                   else
                   {
                       out.print("<script>alert(\"you have less pending and pending amount id"+total+"\")</script>");
                   }
           
        }
%>