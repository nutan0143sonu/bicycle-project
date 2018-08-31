<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Operator Registration</title>
<style>
body{
   width:100%;
   height:100%;
   background:url(image/64.jpg);
   background-size:cover;
   font-family:sans-serif;  
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
<body style="background:url(image/64.jpg);background-size:cover;">
    <%!
String  uid;

%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>

    <div class="menu"><%@ include file="menu.html"%></div>
    <div class="title"><marquee behavior="alternate"><h1>Operator Registration Form</h1></marquee></div>
   <div class="container">
   <div class="left"></div>
   <div class="right">
   
     
       
      <form action="#" align="center">
	  <table>
	  <tr>
	     <td><p>first_name</p></td>
		 <td><p>last_name</p></td>
		 <td><p>E-Mail</p></td>
        </tr>		  
		<tr>
		  <td><input type="text" name="fname" placeholder="First name" required></td>
		 
		  <td><input type="text" name="lname" placeholder="Last name" required></td>
		  <td><input type="text" name="email" placeholder="Email" required></td>
		</tr>
		<tr>
		  
		  <td><p>Mobile No.1</p></td>
		  <td><p>Mobile No.2</p></td>
		  <td><p>Date_of_Birth</p></td>
		</tr>
		<tr>
		  
		   
		  <td><input type="text" name="mobile_no1" placeholder="Mobile NO.1" ></td>
		  <td><input type="text" name="mobile_no2" placeholder="Mobile NO.2" ></td>
		  <td><input type="text" name="dob" placeholder="Date Of Birth" required></td>
		 </tr>
		 <tr>
		 <td><p>Address</p></td>
		 </tr>
		 <tr>
		   <td><input type="text" name="city" placeholder="City*"></td>
		   <td><input type="text" name="locality" placeholder="Locality,area or street*"></td>
		   <td><input type="text" name="flat" placeholder="house no*"></td>
		 </tr>
         <tr>		 
		   <td><input type="text" name="distic" placeholder="distic*"></td>
		   <td><input type="text" name="pincode" placeholder="picode"></td>
		   <td><input type="text" name="state" placeholder="State*"></td>
		 </tr>
		 <tr>
		   
		 </tr>
		 <tr>
		  <td><p>Qualification</p></td>
		  <td><p>User Id</p></td>
		  <td><p>Password</p><td>
		  </tr>
		  <tr>
		  <td><input type="text" name="qualification" placeholder="Qualification" required></td>
		  <td><input type="text" name="user" placeholder="User Id" required></td>
		  <td><input type="password" name="pass" placeholder="Password" required></td>
		  </tr>
		  <tr>
		  <td><p>Gender</p></td>
		  </tr>
		  <tr>
		  <td><input type="radio" name="gender" value="male">Male</td>
		  <td><input type="radio" name="gender" value="female">Female</td>
		  </tr>
		  <tr>
		  <td colspan="3" align="center"><input type="submit" name="submit" value="Submit"></td>
		  </tr>
		  </table>
      </form>
   
   </div>
   </div>
</body>

</html>
<%
     if(request.getParameter("submit")!=null)
     {
         String fname=request.getParameter("fname");
         String lname=request.getParameter("lname");
         String email=request.getParameter("email");
         String mobile_no1=request.getParameter("mobile_no1");
         String mobile_no2=request.getParameter("mobile_no2");
         String dob=request.getParameter("dob");
         String city=request.getParameter("city");
         String locality=request.getParameter("locality");
         String flat=request.getParameter("flat");
         String distic=request.getParameter("distic");
         String pincode=request.getParameter("pincode");
         String state=request.getParameter("state");
         String qualification=request.getParameter("qualification");
         String user_id=request.getParameter("user");
         String pass=request.getParameter("pass");
         String gender=request.getParameter("gender");
         
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
         Statement st=con.createStatement();
         boolean i=st.execute("insert into log(user_id,password,role)values('"+user_id+"','"+pass+"','operator')");
         boolean j=st.execute("insert into operator(user_id,fname,lname,email,gender,mobile_no1,mobile_no2,qualification,role,city,locality,house_no,pincode,distic,state)values('"+user_id+"','"+fname+"','"+lname+"','"+email+"','"+gender+"','"+mobile_no1+"','"+mobile_no2+"','"+qualification+"','operator','"+city+"','"+locality+"','"+flat+"','"+pincode+"','"+distic+"','"+state+"')");
     }
%>