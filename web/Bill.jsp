<%-- 
    Document   : Dummy
    Created on : Mar 23, 2018, 4:19:53 PM
    Author     : Nutan Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
String  uid;

%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>
<!DOCTYPE html>
<html lang = "en">
    

 
    
    
    
 <head>
     
     
       <style>
        body{
        background-image:url('image/20.jpg');
        background-size:cover;
        font-family:verdana;
        font-size:10px;
        margin:0px;
        line-height:10px;
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
 
     
      <!-- Bootstrap -->
      <link href = "css/bootstrap.min.css" rel = "stylesheet">
      
     <script src = "js/jquery.min.js"></script>
   
        
     
     
     <script>  

    $(document).ready(function(){
        
        $("#searchtxt").keyup(function(){
            
          text=  $("#searchtxt").val();
          
          
    $.post("http://localhost:8084/WebApplication1/cycleBill.jsp",
    {
       val:text
    },
    function(data, status){
      $("#mylocation").html(data);
    });
    
    
        
    });
        
    });

  $(document).ready(function(){
        
        $("#searchtxt1").keyup(function(){
            
          text=  $("#searchtxt1").val();
          
          
    $.post("http://localhost:8084/WebApplication1/partBill.jsp",
    {
       val1:text
    },
    function(data, status){
      $("#mylocation1").html(data);
    });
    
    
        
    });
        
    });
    $(document).ready(function(){
        $("#show").click(function(){
            $.post("http://localhost:8084/WebApplication1/showBill.jsp",function(data,status){
                $("#CyclePlace").html(data);
            });
        });
    });
    

</script> 
 </head>    
 <body>
     
     
     <div style="position:absolute;left: 110px;right: 0;bottom: 0;top: 0; height:50px">
    
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
    
    
    
    
    
    
     
     
     
     <div class="container" style="margin-top: 140px;">
        <div class="row">
            <div class="col-md-12">
                <table border="0" align="center">
                   
                    <tr><th colspan="3" align="center"><h1>Enter Customer Detail</h1></th></tr>
                     <tr><th>Customer Name</th>
                         <td><input type="text" id="customer"></td>
                     </tr>
                     <tr><td><br></td></tr>
                     <tr><th>Mobile Number</th>
                         <td><input type="text" id="mobile"></td>
                     </tr>
                       <tr><td><br></td></tr>
                     <tr>
                         <td colspan="2" align="center"><button type="button" class = "btn btn-primary btn-lg active" id="save" data-dismiss = "modal">
                               Save
                           </button>
                          </td>

                     </tr>
                </table>   
    </div>
    </div>
    </div>  
         
   <script src = "js/bootstrap.min.js"></script>         
   <div class="container"><div class="row">
      <div class="col-md-4">
<h1>Enter Product Detail</h1>  
<form name="vinform"> 
<input type="text" name="name"  id="searchtxt" placeholder="Enter Cycle Detail" >  
<input type="text" name="name1"  id="searchtxt1" placeholder="Enter Part Detail" >
</form>  
<span id="mylocation"></span>
<span id="mylocation1"></span>
</div>
   </div>
    </div>
   <br><br><br>
   <div class="container">
       <div class="row">
           <div class="col-md-12">
                <button class = "btn btn-primary btn-lg active" id="show">
                               SHOW DATA
                </button>

           </div>
       </div>
      
       <div class="row">
           <div class="col-md-12">
               <span id="CyclePlace"></span>
           </div>
       </div>
   </div>
     <script src="Bill.js"></script>
 </body>
</html>
<%
      
%>