  //color
  $(document).ready(function(){
      
         $("#add").click(function(){
             color=$("#color_name").val();
             alert(color);
             
             $.post("http://localhost:8084/WebApplication1/reqHandler",{
                ccolor:color   
             },function(data,status){
                 alert(data);
             }
             );
             
         });
});
//company
$(document).ready(function(){
    
    $("#add1").click(function(){
    company=$("#company1").val();
    alert(company);
       
      $.post("http://localhost:8084/WebApplication1/companyReg",{
          ccompany:company
      },
          function(data,source){
             alert(data);
          }); 
    });
});
//cycle_model

$(document).ready(function(){
    $("#add2").click(function(){
        model=$("#cycle_model").val();
        alert(model);
        
        $.post("http://localhost:8084/WebApplication1/cycleModel",{
         cmodel:model
     },function(data,source){
         alert(data);    
 });
        
    });
    
});
//cycle_frame

$(document).ready(function(){
    $("#add3").click(function(){
        frame=$("#frame_size").val();
        type=$("#type").val();
        alert("frame_size"+frame+"\n type is "+type);
        
        $.post("http://localhost:8084/WebApplication1/cycleFrame",{
         cframe:frame,
         ctype:type
     },function(data,source){
         alert(data);    
 });
        
    });
    
});
//part_name
$(document).ready(function(){
    $("#add4").click(function(){
        part=$("#part_name").val();
        alert(part);
        
        $.post("http://localhost:8084/WebApplication1/partName",{
         cpart:part
     },function(data,source){
         alert(data);    
 });
        
    });
    
});
