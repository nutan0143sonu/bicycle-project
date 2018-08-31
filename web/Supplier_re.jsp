<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Supplier Registration</title>
<style>
body{
   width:100%;
   height:100%;
   background:url(image/64.jpg);
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

    




.title{
    text-align:center;
	padding:50px 0 20px;
}
.title h1{
	       margin:0;
		   padding:0;
		   color:#262626;
		   text-transform:uppercase;
		   font-size:36px;
		   
	   }
.container{
	        width:65%;
			height:550px;
			background:#fff;
			margin:0 auto;
			border:2px solid #fff;
	        box-shadow:0 15px 40ps rgba(0,0,0,.5);
	   }
	   .container .left{
	        float:left;
			width:45%;
			height:550px;
			background-image:url(image/5.jpg);
			background-size:cover;
			box-sizing:border-box;
			
	   }
	   .container .right{
	         float:right;
			 width:55%;
			 padding-left:5px;
			 height:550px;
			 box-sizing:border-box;
	   }
	   .middle 
	   {
	      width:100%;
		   padding:30px 40px;
		   box-sizing:border-box;
		   height:400px;
		   background:#fff;
	   }
	  .middle p{
	      margin: 0;
		   padding:0;
		   font-weight:bold;
		   color:#a6af13;
	  }  
 .middle input
	   {
	      
	       margin-bottom:10px;
	   }
	   .middle input[type="text"],
	   .middle input[type="password"]
	   {
	    width:130px;
	    border:none;
		padding-left:3px;
		padding-top:1px;
		  border-bottom:2px solid #a6af13;
		  outline:none;
		  height:36px;
	   }
	   .middle input[type="text"]:focus,
	   .middle input[type="password"]:focus
	   {
	         border-bottom:2px solid #262626;
	   }
	   .middle input[type="submit"]
	   { 
	      width:80px;
	      border:none;
		  outline:none;
		  height:40px;
		  color:#fff;
		  background:#262626;
		  cursor:pointer;
		  border-radius:5px;
	   }
	   .middle input[type="submit"]:hover
	   {
	       background-color:#a6af13;
	   }
	  	  
</style> 
</head>
<body>
    
    
    
      
    <div style="position:absolute;left: 110px;right: 0;bottom: 0;top: 0; height:75px;">
    
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
    
    
    
    <div class="title" style="margin-top:50px;"><marquee behavior="alternate"><h1>Supplier Registration Form</h1></marquee></div>
    <div class="container" style="margin-top:30px;">
   <div class="left"></div>
   <div class="right">
   <div class="middle">
      <form>
	  <table>
	  <tr>
	     <td><p>first_name</p></td>
		 <td><p>middle_name</p></td>
		 <td><p>last_name</p></td>
        </tr>		  
		<tr>
		  <td><input type="text" name="fname" placeholder="First name" required></td>
		  <td><input type="text" name="mname" placeholder="Middle name" ></td>
		  <td><input type="text" name="lname" placeholder="Last name" required></td>
		</tr>
		<tr>
	     <td><p>GST No.</p></td>
		 <td><p>E-mail</p></td>
		 <td><p>Farm-name</p></td>
        </tr>		  
		<tr>
		  <td><input type="text" name="gst_no" placeholder="GST NO." required></td>
		  <td><input type="text" name="email" placeholder="E-mail" ></td>
		  <td><input type="text" name="farm_name" placeholder="Farm-name" required></td>
		</tr>
		<tr>
		  
		  <td><p>Mobile No.</p></td>
		</tr>
		<tr>
		  <td><input type="text" name="owner_mobile_no" placeholder="Owner Mobile No." required></td>
		   <td><input type="text" name="shop_mobile_no" placeholder="Shop Mobile NO." ></td>
		  <td><input type="text" name="manager_mobile_no" placeholder="Manager Mobile NO." ></td>
		 </tr>
		 <tr>
		 <td><p>Address</p></td>
		 </tr>
		 <tr>
		   <td><input type="text" name="city" placeholder="City*"></td>
		   <td><input type="text" name="locality" placeholder="Locality,area or street*"></td>
		   <td><input type="text" name="flat_no" placeholder="Flat no.,area or street*"></td>
		 </tr>
         <tr>		 
		   
		   <td><input type="text" name="distic" placeholder="distic"></td>
		   <td><input type="text" name="pincode" placeholder="pincode"></td>
		   <td><input type="text" name="state" placeholder="state*"></td>
		 </tr>
		 
		 <tr>
		  <td><p>IFSC_Code</p></td>
		  <td><p>Account No.</p></td>
		  <td><p>Date of Birth</p></td>
		  
		  </tr>
		  <tr>
		  <td><input type="text" name="ifsc_code" placeholder="IFSC_Code" required></td>
		  <td><input type="text" name="account_no" placeholder="Account_no" required></td>
		  <td><input type="text" name="dob" placeholder="Date of Birth" ></td>
		  </tr> 
		  <tr>
		  <td><p>Gender</p></td>
		  </tr>
		  <tr>
		  <td><input type="radio" name="gender" value="male" />Male</td>
		  <td><input type="radio" name="gender" value="female"/>Female</td>
		  </tr>
		  <tr>
		  <td colspan="3" align="center"><input type="submit" name="submit" value="Submit"></td>
		  </tr>
		  </table>
      </form>
   </div>
   </div>
   </div>
</body>

</html>
<%
     if(request.getParameter("submit")!=null)
     {
        String fname=request.getParameter("fname");
        String mname=request.getParameter("mname");
        String lname=request.getParameter("lname");
        String gst_no=request.getParameter("gst_no");
        String email=request.getParameter("email");
        String farm_name=request.getParameter("farm_name");
        String owner_no=request.getParameter("owner_mobile_no");
        String manager_no=request.getParameter("manager_mobile_no");
        String shop_no=request.getParameter("shop_mobile_no");
        String city=request.getParameter("city");
        String locality=request.getParameter("locality");
        String flat_no=request.getParameter("flat_no");
        String distic=request.getParameter("distic");
        String pincode=request.getParameter("pincode");
        String state=request.getParameter("state");
        String ifsc_code=request.getParameter("ifsc_code");
        String account_no=request.getParameter("account_no");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
        Statement st=con.createStatement();
        boolean i=st.execute("insert into supplier(gst_no,farm_name,fname,mname,lname,email,owner_mobile_no,manager_mobile_no,shop_mobile_no,ifsc_code,account_no,dob,gender,city,locality,house_no,distic,pincode,state)values('"+gst_no+"','"+farm_name+"','"+fname+"','"+mname+"','"+lname+"','"+email+"','"+owner_no+"','"+manager_no+"','"+shop_no+"','"+ifsc_code+"','"+account_no+"','"+dob+"','"+gender+"','"+city+"','"+locality+"','"+flat_no+"','"+distic+"','"+pincode+"','"+state+"')");
       out.print("<script>alert(\"Registration completed\")</script>");
     }

%>