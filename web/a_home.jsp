<%!
String  uid;

%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
       <head>
	   <title> Transparent drop-down navbar</title>
	   <style>
	   body{
	   background-image:url('s.jpg');
	   background-size:cover;
	   font-family:verdana;
	   font-size:10px;
	   margin:0px;
	   line-height:10px;
	   }
	   </style>
           <style>
               
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

video {
	height: 100%;
	width: 100%;
}
.absolute


           </style>
	        <link rel="stylesheet" type="text/css" href="Dropdown.css"/>
	   </head>
   <body>
               
 <div class="vdiv">
<video autoplay loop>
<source src="http://localhost:8084/WebApplication1/vdo.mp4" type="video/mp4" class="video">

</video>

</div>
               
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
   </body>
</html>
