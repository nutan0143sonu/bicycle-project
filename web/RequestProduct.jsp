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
        background-image:url('image/61.jpg');
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
          
          
    $.post("http://localhost:8084/WebApplication1/cycleRequest.jsp",
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
          
          
    $.post("http://localhost:8084/WebApplication1/partRequest.jsp",
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
            $.post("http://localhost:8084/WebApplication1/showRequest.jsp",function(data,status){
                $("#CyclePlace").html(data);
            });
        });
    });
    

</script> 
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
    
    
     
     
     
     
     <div class="container" style="margin-top: 155px;margin-left: 100px;">
        <div class="row">
            <div class="col-md-12">
                <table border="0" align="center">
                    
                    <tr><th colspan="3" align="center"><h1>Enter Request Product Detail</h1></th></tr>
                     <tr><th>GST number</th>
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
    <br><br><br> <div class="col-md-4">
  <button class = "btn btn-primary  active" data-toggle = "modal" data-target = "#cycleRequest">
New Cycle Request
</button>
<button class = "btn btn-primary  active" data-toggle = "modal" data-target = "#partRequest">
    New Part Request
</button>
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
   <!--cycle modal-->
<!-- Modal -->
<div class = "modal fade" id = "cycleRequest" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1190px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
              Request Cycle
            </h4>
         </div>
         
               <div class = "modal-body">
             
                <div class = "panel panel-primary">
                <div class = "panel-heading">
               <h3 class = "panel-title">Enter Cycle Detail</h3>
               </div>
                       
                <div class = "panel-body">
                    <table class="table">
                 
                 
                 <tr>
                     <th>Model Name</th>
                     <th>Frame_Size</th>
                     <th>Company_name</th>
                     <th>color</th>
                     <th>Type</th>
                     <th>Quantity</th>
                     
                 </tr>
                 <tr>
                      <td><input type="text" id="model" placeholder="Enter Model Name"></td>
                     <td><input type="text" id="fz" placeholder="Enter Frame Size"></td>
                     <td><input type="text" id="company" placeholder="Enter Company Name"></td>
                      <td><input type="text" id="color" placeholder="Enter color"></td>
                      <td><input type="text" id="type" placeholder="Enter type of cycle"></td>
                      <td><input type="text" id="quantity" placeholder="Enter Quantity of cycle"></td>
                 </tr>
                 
             </table>
                </div>
                </div>
             </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-primary btn-lg" id="btnadd" data-dismiss = "modal">
               ADD
            </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.cyclemodal -->
<!--end -->
  
<!-- Modal -->
<div class = "modal fade" id = "partRequest" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1190px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
              Request Cycle
            </h4>
         </div>
         
               <div class = "modal-body">
             
                <div class = "panel panel-primary">
                <div class = "panel-heading">
               <h3 class = "panel-title">Enter part Detail</h3>
               </div>
                       
                <div class = "panel-body">
                    <table class="table">
                 
                 
                 <tr>
                     <th>part Name</th>
                     <th>Frame_Size</th>
                     <th>Company_name</th>
                     <th>color</th>
                     <th>Type</th>
                     <th>Another Feature</th>
                     <th>Quantity</th>
                     
                 </tr>
                 <tr>
                      <td><input type="text" id="model1" placeholder="Enter part Name" style="width:110px;"></td>
                     <td><input type="text" id="size" placeholder="Enter  Size" style="width:110px;"></td>
                     <td><input type="text" id="company1" placeholder="Enter Company Name" style="width:110px;"></td>
                      <td><input type="text" id="color1" placeholder="Enter color" style="width:110px;"></td>
                      <td><input type="text" id="type1" placeholder="Enter type of cycle" style="width:110px;"></td>
                      <td>
                          <select id="fe" style="width:110px;">
                              <option>Select Part</option>
                              <option value="Small Part">Small Part</option>
                              <option value="Big Part">Big Part</option>
                              <option value="Mini Part">Mini Part</option>
                              <option value="Ranger Part">Ranger Part</option>
                          </select>
                      </td>
                      <td><input type="text" id="quantity1" placeholder="Enter Quantity of cycle" style="width:110px;"></td>
                 </tr>
                 
             </table>
                </div>
                </div>
             </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-primary btn-lg" id="btnadd1" data-dismiss = "modal">
               ADD
            </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.part modal -->
<!--end -->

   <script>
         $(document).ready(function(){
    $("#save1").click(function(){
        
        gst=$("#gst").val();
        //alert(customer+"\n"+mobile);
        $.post("http://localhost:8084/WebApplication1/request",{
            
            cgst:gst
        },function(data,status){
            alert(data);
        });
      });
});
    $(document).ready(function(){
        $("#btnadd").click(function(){
            model=$("#model").val();
            frame=$("#fz").val();
            company=$("#company").val();
            color=$("#color").val();
            type=$("#type").val();
            
            quantity=$("#quantity").val();
            //alert(fe);
            $.post("http://localhost:8084/WebApplication1/newcycleRequest",{
                cmodel:model,
                cframe:frame,
                ccompany:company,
                ccolor:color,
                ctype:type,
                
                cquantity:quantity
            },
           function(data,status){    
            alert(data);       
    });
        });
    });
     $(document).ready(function(){
        $("#btnadd1").click(function(){
            model=$("#model1").val();
            frame=$("#size").val();
            company=$("#company1").val();
            color=$("#color1").val();
            type=$("#type1").val();

        fe=$("#fe").val();
        quantity=$("#quantity1").val();
         alert(model);            
            $.post("http://localhost:8084/WebApplication1/newpartRequest",{
                cmodel:model,
                cframe:frame,
                ccompany:company,
                ccolor:color,
                ctype:type,
                cfeature:fe,
                cquantity:quantity
            },
           function(data,status){    
            alert(data);       
    });
        });
    });
   </script>
 </body>
</html>