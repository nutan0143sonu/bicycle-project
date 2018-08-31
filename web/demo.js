$(document).ready(function(){
    $("#btnadd").click(function(){
        cycle=$("#cn").val();
        frame=$("#fz").val();
        type=$("#type").val();
        //alert(cycle+"\n"+frame+"\n"+type);
        $.post("http://localhost:8084/WebApplication1/demoCycleBill",{
            
           ccycle:cycle,
           cframe:frame,
           ctype:type
        },function(data,source){
            alert(data);
    });
        
    });
});
$(document).ready(function(){
    $("#save").click(function(){
        customer=$("#cname").val();
        mobile=$("#mnumber").val();
        //alert(customer+"\n"+mobile);
        
        $.post("http://localhost:8084/WebApplication1/demobill",{
            ccustomer:customer,
            cmobile:mobile
        },
        function(data,source){
            alert(data);
    });
    });
});