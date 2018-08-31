<%-- 
    Document   : demo
    Created on : Mar 29, 2018, 7:53:47 PM
    Author     : Nutan Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
   
   <head>
      <meta charset = "utf-8">
      <meta http-equiv = "X-UA-Compatible" content = "IE = edge">
      <meta name = "viewport" content = "width = device-width, initial-scale = 1">
      
      <title>Bootstrap 101 Template</title>
      
      <!-- Bootstrap -->
      <link href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet">
      
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      
      <!--[if lt IE 9]>
      <script src = "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src = "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      
   </head>
   
   <body>
       <div class="container">
           <div class="row">
               <div class="col-md-12">
                   <table><!--first table-->
                       <tr> 
                           <td>Customer-Name :</td><td> <input type="text" id="cname"/></td>
                       </tr>
                         <tr><td><br/></td></tr>
                       <tr> 
                           <td>Mobile-Number: </td><td><input type="text" id="mnumber"/></td>
                       </tr>
                       
                       <tr><td><br/></td></tr>
                       <tr> 
                           <td> 
                           
                           <button class = "btn btn-primary btn-lg active" data-toggle = "modal" data-target = "#cycleModal">
                               Cycle
                           </button>

                           
                           </td>
                           <td> 
                           
                           <button type="button" class = "btn btn-primary btn-lg active" id="save" data-dismiss = "modal">
                               Save
                           </button>

                           
                           </td>
                           
                       </tr>
                   </table>
               </div>
           </div>
       </div>
      
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
      
      <div class = "modal fade" id = "cycleModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1240px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel" >
              Cycle Bill
            </h4>
         </div>
         
               <div class = "modal-body">
             
                <div class = "panel panel-primary" style="width:1200px;">
                <div class = "panel-heading">
               <h3 class = "panel-title">Enter Cycle Detail</h3>
               </div>
                       
                <div class = "panel-body">
                    <table class="table">
                 
                 <tr>
                     <th>Cycle_name</th>
                     <th>Frame_size</th>
                     <th>type</th>
                     
                 </tr>
                 <tr>
                     <td><input type="text" id="cn" placeholder="Enter Cycle Name"></td>
                     <td><input type="text" id="fz" placeholder="Enter Frame Size"></td>
                     <td><input type="text" id="type" placeholder="Enter Type"></td>         
                 </tr>
        </table>
                </div>
                </div>
             </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-primary btn-lg" id="btnadd" data-dismiss = "modal">
               ADD
            </button>
            
            <button type = "button" class = "btn btn-primary btn-lg">
               Done
            </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.cyclemodal -->
<!--end -->
   <script src="demo.js"></script>
   </body>
</html>