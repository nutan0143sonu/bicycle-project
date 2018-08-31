<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
   <head>
   <title>log page</title>
   
   <style>
       
	   body
	   {
	      margin:0;
		  padding:0;
	      background-image:url(image/3.png);
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
	        width:50%;
			height:400px;
			background:#fff;
			margin:0 auto;
			border:2px solid #fff;
	        box-shadow:0 15px 40ps rgba(0,0,0,.5);
	   }
	   .container .left{
	        float:left;
			width:50%;
			height:400px;
			background-image:url(image/5.jpg);
			background-size:cover;
			box-sizing:border-box;
	   }
	   .container .right{
	         float:right;
			 width:50%;
			 height:400px;
			 box-sizing:border-box;
	   }
	   .middle{
	       width:100%;
		   padding:80px 40px;
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
	      
	       margin-bottom:20px;
	   }
	   .middle input[type="text"],
	   .middle input[type="password"]
	   {
	    width:100%;
	    border:none;
		  border-bottom:2px solid #a6af13;
		  outline:none;
		  height:40px;
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
	   .middle a{
	       color:#262626;
		   font-size:12px;
		   font-weight:bold;
	   }
	   .middle a:hover{
	        background-color:#a6af13;
	   }
   </style>
   </head>
<body>
  <div class="title"><h1>LOG IN FORM</h1></div>
  <div class="container">
  <div class="left"></div>
  <div class="right">
      <%
          if(request.getParameter("sub")!=null)
          {
           String id=request.getParameter("user");
          System.out.println("User Name\t"+id);
           String pass=request.getParameter("pas");
          session.setAttribute("uid", id);
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
          System.out.println("Connected");
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from log where user_id='"+id+"'");
          System.out.println("executed");
          while(rs.next())
          {
              if(rs.getString(2).equals(pass))
              {
                  if(rs.getString(3).equals("admin"))
                      response.sendRedirect("a_home.jsp");
              
                //  else
                  //    response.sendRedirect("operator_re.jsp");
               
              }
              else
              {
               
                  out.println("<script>alert(\"UserID and Password is incorrect\")</script>");
              }
          }
          }
          
      %>
      
   <div class="middle" >
       <form align="center" method="post">
		    <p>User ID</p>
		   <input type="text" name="user"  placeholder="User ID" required/><br>
		   <p>Password</p>
		   <input type="password" name="pas"  placeholder="******" required/><br><br>&nbsp&nbsp
		   <input type="submit" name="sub" value="LOGIN">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		   <input type="submit" name="res" value="RESET"><br><br>&nbsp
		   <a href="#">Forget Password</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		   <a href="#">Change Password</a>
		   
		</form>
		</div>
		</div>
		</div>
   </body>
</html>