<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html lang = "en">
   
   <head>
      <meta charset = "utf-8">
      <meta http-equiv = "X-UA-Compatible" content = "IE = edge">
      <meta name = "viewport" content = "width = device-width, initial-scale = 1">
      
      <title>Registration Template</title>
      
      <!-- Bootstrap -->
      <link href = "css/bootstrap.min.css" rel = "stylesheet">
      
     <script src = "js/jquery.min.js"></script>

      
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      
      <!--[if lt IE 9]>
      <script src = "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src = "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<style>
    #abc
    {
        
        border:1px solid blue;
        background:url(image/backk.jpg);
        
    }
    body
    {
        background:url(image/bck.jpg);
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
       <%!
String  uid;

%>
<%
uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>



 
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
    
    





       <div class="container" id="abc" style="border:1px solid red; margin-top:170px;"><!--Start container-->
           <div class="row"><!--start row-->
               <div class="col-md-6"><!--start coloumn-->
                     <!-- Button trigger modal -->
                           <button type="button" class="btn btn-primary btn-lg" data-toggle = "modal" data-target = "#colorModal">All Color</button>
                           <!-- Modal -->
                           
                           <div class = "modal fade" id = "colorModal" tabindex = "-1" role = "dialog" 
                              aria-labelledby = "myModalLabel" aria-hidden = "true">
   
                           <div class = "modal-dialog">
                           <div class = "modal-content">
         
                              <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                                      &times;
                                    </button>
            
                                    <h4 class = "modal-title" id = "myModalLabel">
                                        Color Registration
                                    </h4>
                              </div>
         
                              <div class = "modal-body">
                                  <!--Panel Start-->
                                     <div class = "panel panel-primary">
                                            <div class = "panel-heading">
                                                  <h3 class = "panel-title">Color Name</h3>
                                           </div>
                                         
                                            <div class = "panel-body">
                                             
                                                 
                                                     Color Name:
                                                     <input type="text" id="color_name" placeholder="Enter Color Name">
                                                 
                                            </div>
                                      </div>
                                  <!--panel end-->
                               </div>
         
                              <div class = "modal-footer">
                                 <button type = "button" class = "btn btn-primary btn-lg" id="add" data-dismiss = "modal">
                                    Add
                                </button>
            
                                 <button type = "button" class = "btn btn-primary btn-lg" id="done">
                                    Done
                                  </button>
                      </div>
         
                       </div><!-- /.modal-content -->
                           </div><!-- /.modal-dialog -->
  
<                         </div><!-- /.modal -->

                       
               </div><!--end coloumn-->

                <div class="col-md-6" >
                   
                   <button type="button" class="btn btn-primary btn-lg" data-toggle = "modal" data-target = "#company">Company</button>
                           <!-- Modal -->
                           
                           <div class = "modal fade" id = "company" tabindex = "-1" role = "dialog" 
                              aria-labelledby = "myModalLabel" aria-hidden = "true">
   
                           <div class = "modal-dialog">
                           <div class = "modal-content">
         
                              <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                                      &times;
                                    </button>
            
                                    <h4 class = "modal-title" id = "myModalLabel">
                                        Company Registration
                                    </h4>
                              </div>
         
                              <div class = "modal-body">
                                  <!--Panel Start-->
                                     <div class = "panel panel-primary">
                                            <div class = "panel-heading">
                                                  <h3 class = "panel-title"> Company</h3>
                                           </div>
                                         
                                            <div class = "panel-body">
                                             
                                                 
                                                     Company:
                                                     <input type="text" id="company1" placeholder="Enter Company Name"><br><br>
                                                     
                                            </div>
                                      </div>
                                  <!--panel end-->
                               </div>
         
                              <div class = "modal-footer">
                                 <button type = "button" class = "btn btn-primary btn-lg" id="add1" data-dismiss = "modal">
                                    Add
                                </button>
            
                                 <button type = "button" class = "btn btn-primary btn-lg" id="done">
                                    Done
                                  </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->
               </div>
           
           
               
               </div>
           <div class="row"><div class="col-md-12"><br></div></div>
           <div class="row"><div class="col-md-12"><br></div></div>
           
           <div class="row"><!--start row-->
               <div class="col-md-6"><!--start coloumn-->
                     <!-- Button trigger modal -->
                           <button type="button" class="btn btn-primary btn-lg" data-toggle = "modal" data-target = "#cycleModal">Cycle Modal</button>
                           <!-- Modal -->
                           
                           <div class = "modal fade" id = "cycleModal" tabindex = "-1" role = "dialog" 
                              aria-labelledby = "myModalLabel" aria-hidden = "true">
   
                           <div class = "modal-dialog">
                           <div class = "modal-content">
         
                              <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                                      &times;
                                    </button>
            
                                    <h4 class = "modal-title" id = "myModalLabel">
                                        Cycle Modal Registration
                                    </h4>
                              </div>
         
                              <div class = "modal-body">
                                  <!--Panel Start-->
                                     <div class = "panel panel-primary">
                                            <div class = "panel-heading">
                                                  <h3 class = "panel-title">Model Name</h3>
                                           </div>
                                         
                                            <div class = "panel-body">
                                             
                                                 
                                                     Modal Name:
                                                     <input type="text" id="cycle_model" placeholder="Enter Modal Name">
                                                 
                                            </div>
                                      </div>
                                  <!--panel end-->
                               </div>
         
                              <div class = "modal-footer">
                                 <button type = "button" class = "btn btn-primary btn-lg" id="add2" data-dismiss = "modal">
                                    Add
                                </button>
            
                                 <button type = "button" class = "btn btn-primary btn-lg" id="done">
                                    Done
                                  </button>
                      </div>
         
                       </div><!-- /.modal-content -->
                           </div><!-- /.modal-dialog -->
  
<                         </div><!-- /.modal -->

                       
               </div><!--end coloumn-->
                    <div class="col-md-6">
                   
                   <button type="button" class="btn btn-primary btn-lg" data-toggle = "modal" data-target = "#cycleFrameModal">cycle Frame</button>
                           <!-- Modal -->
                           
                           <div class = "modal fade" id = "cycleFrameModal" tabindex = "-1" role = "dialog" 
                              aria-labelledby = "myModalLabel" aria-hidden = "true">
   
                           <div class = "modal-dialog">
                           <div class = "modal-content">
         
                              <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                                      &times;
                                    </button>
            
                                    <h4 class = "modal-title" id = "myModalLabel">
                                        Cycle Frame Registration
                                    </h4>
                              </div>
         
                              <div class = "modal-body">
                                  <!--Panel Start-->
                                     <div class = "panel panel-primary">
                                            <div class = "panel-heading">
                                                  <h3 class = "panel-title">Cycle Frame</h3>
                                           </div>
                                         
                                            <div class = "panel-body">
                                             
                                                 
                                                     Frame Size:
                                                     <input type="text" id="frame_size" placeholder="Enter Frame Size"><br><br>
                                                     Gender Type:
                                                     <input type="text" id="type" placeholder="Enter type">
                                            </div>
                                      </div>
                                  <!--panel end-->
                               </div>
         
                              <div class = "modal-footer">
                                 <button type = "button" class = "btn btn-primary btn-lg" id="add3" data-dismiss = "modal">
                                    Add
                                </button>
            
                                 <button type = "button" class = "btn btn-primary btn-lg" id="done">
                                    Done
                                  </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->
               </div>
           
           
                 
              
               </div>
           <div class="row"><div class="col-md-12"><br></div></div>
           <div class="row"><div class="col-md-12"><br></div></div>
           <div class="row">
               <div class="col-md-12">
                   
                   <button type="button" class="btn btn-primary btn-lg" data-toggle = "modal" data-target = "#partname">Parts Name</button>
                           <!-- Modal -->
                           
                           <div class = "modal fade" id = "partname" tabindex = "-1" role = "dialog" 
                              aria-labelledby = "myModalLabel" aria-hidden = "true">
   
                           <div class = "modal-dialog">
                           <div class = "modal-content">
         
                              <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                                      &times;
                                    </button>
            
                                    <h4 class = "modal-title" id = "myModalLabel">
                                        Parts Name Registration
                                    </h4>
                              </div>
         
                              <div class = "modal-body">
                                  <!--Panel Start-->
                                     <div class = "panel panel-primary">
                                            <div class = "panel-heading">
                                                  <h3 class = "panel-title">Parts Name</h3>
                                           </div>
                                         
                                            <div class = "panel-body">
                                             
                                                 
                                                     Parts Name:
                                                     <input type="text" id=part_name placeholder="Enter Parts Name"><br><br>
                                                     
                                            </div>
                                      </div>
                                  <!--panel end-->
                               </div>
         
                              <div class = "modal-footer">
                                 <button type = "button" class = "btn btn-primary btn-lg" id="add4" data-dismiss = "modal">
                                    Add
                                </button>
            
                                 <button type = "button" class = "btn btn-primary btn-lg" id="done">
                                    Done
                                  </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->
               </div>
           </div>
       </div><!--end container-->
      
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src = "js/bootstrap.min.js"></script>
      <script src="registration.js"></script>
   </body>
</html>
