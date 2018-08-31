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
        background-image:url('image/backk.jpg');
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
        
        $("#show").click(function(){ 
    $.post("http://localhost:8084/WebApplication1/receive.jsp",
    
    function(data, status){
      $("#mylocation").html(data);
    });
    
    
        
    });
        
    });
    $(document).ready(function(){
        
        $("#showdata").click(function(){ 
    $.post("http://localhost:8084/WebApplication1/showReceiveTable.jsp",
    
    function(data, status){
      $("#mylocation1").html(data);
    });
    });
    });
</script> 
 </head>    
 <body>
     
     
     
       
    <div style="position:absolute;left: 110px;right: 0;bottom: 0;top: 0; height:50px;">
    
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
    
     
     
     
     
     <div class="container">
        <div class="row" style="margin-top:5px;height: 200px;">
            <div class="col-md-12" style="margin-top:155px;height: 200px;">
                <table border="0" align="center">
                    <div style="margin-top: 5px;margin-left: 100px;">
                    <tr><th colspan="3" align="center"><h1>Enter Receive Product Detail</h1></th></tr>
                     <tr><th>Request Id</th>
                         <td><input type="text" id="gst"></td>
                     </tr>
                     <tr><td><br></td></tr>
                     <tr>
                         <td colspan="2" align="center"><button type="button" class = "btn btn-primary btn-lg active" id="save1" data-dismiss = "modal">
                               Save
                           </button>
                          </td>

                     </tr>
                </table>   
    </div>
    </div>
    </div>
     <div class="container">
         <div class="row">
             <div class="col-md-12" align="center">
                 <br>
                 <h1>Requested Data</h1>
                 <br>
                 <button type = "button" class = "btn btn-primary btn-lg active" id="show" >
               Click Me
               </button>
             </div>
         </div>
         <div class="row">
             <div class="col-md-12">
                 <span id="mylocation"></span>
             </div>
         </div>
         <div class="row">
             <div class="col-md-12" align="center">
                 <br>
                 <h1>Received data</h1>
                 <br>
                 <button type = "button" class = "btn btn-primary btn-lg active" id="showdata" >
               Show Receive Data
               </button>
             </div>
         </div>
         <div class="row">
             <div class="col-md-12">
                 <span id="mylocation1"></span>
             </div>
             
         </div>
     </div>     
    <script src = "js/bootstrap.min.js"></script>         
   
   <script>
         $(document).ready(function(){
    $("#save1").click(function(){
        
        gst=$("#gst").val();
        //alert(customer+"\n"+mobile);
        $.post("http://localhost:8084/WebApplication1/receive",{
            
            cgst:gst
        },function(data,status){
            alert(data);
        });
      });
});
   
   </script>
 </body>
</html>