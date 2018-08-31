<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<script type="text/javascript">

function loadXMLDoc()
{
var xmlhttp;
var keys=document.dummy.sele.value
var urls="db_fetch.jsp?ok="+keys
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 
xmlhttp.onreadystatechange=function()
  {
 
removeall();
 
  if (xmlhttp.readyState==4)
    {
            z=0;
            var roott=xmlhttp.responseXML.documentElement;
            var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
 
            while(ress!=null)
            {
                    addoptions(ress)
                    z++
             var ress=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
            }
    }
 
    function removeall()
    {
 
        var ct=document.dummy.sele2.length;
        for(i=ct; i>=0; i--)    {    
            document.dummy.sele2.options[i]=null;
             }
    }
 
    function addoptions(reslt)
    {
 
        var ct1=document.createElement("OPTION");
        ct1.text=reslt;
        ct1.value=reslt;
        document.dummy.sele2.options.add(ct1);
 
    }
}    
 
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
function loadXMLDoc1()
{
var xmlhttp;
var keys=document.dummy.sele2.value
var keys1=document.dummy.sele.value
alert(keys);
var urls="db_fetch_1.jsp?ok="+keys
var urls="db_fetch_1.jsp?ok1="+keys1
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 
xmlhttp.onreadystatechange=function()
  {
 
removeall();
 
  if (xmlhttp.readyState==4)
    {
            z=0;
            var roott1=xmlhttp.responseXML.documentElement;
            var ress1=roott1.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
 
            while(ress1!=null)
            {
                    addoptions(ress)
                    z++
             var ress1=roott.getElementsByTagName("empname")[z].childNodes[0].nodeValue;
            }
    }
 
    function removeall()
    {
 
        var ct=document.dummy.sele3.length;
        for(i=ct; i>=0; i--)    {    
            document.dummy.sele3.options[i]=null;
             }
    }
 
    function addoptions(reslt)
    {
 
        var ct1=document.createElement("OPTION");
        ct1.text=reslt;
        ct1.value=reslt;
        document.dummy.sele3.options.add(ct1);
 
    }
}    
 
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}



</script>
</head>
<body>
 
<form name="dummy">
<font face="verdana" size="2">
Company Name:    <select name="sele" onchange="loadXMLDoc()">
            <option>select Company Name</option>
            <%
                  Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invertis","root","invertis");
               Statement st=con.createStatement();
               String sql="select * from company";
               ResultSet rs=st.executeQuery(sql);
               out.println(sql);
               while(rs.next())
               {
                   String company=rs.getString("company_name");
                    out.println("<option value="+rs.getString("company_id")+">"+rs.getString("company_name")+"</option>");
                    //out.println("value");
               }
             %>
                    </select>
 
<br><br>Model Name:    <select name="sele2" onchange="loadXMLDoc1()">
            <option>--choose model Name--</option>
    </select>

<br><br>Frame Size And Type:    <select name="sele3" >
            <option>--choose Frame Size--</option>
    </select>

<br><br> Color Name:    <select name="sele4" >
            <option>--choose color Name--</option>
    </select>
 <br><br><input type="text" name="Frame_no" placeholder=" Enter Frame number"/>
<br><br><input type="text" name="quantity" placeholder=" Enter Quantity"/>
 <br><br><input type="text" name="gst" placeholder=" ENTER GST"/>
 <br><br><input type="text" name="discount"placeholder="Enter Discount"/>
 <br><br><input type="text" name="perAmount" placeholder="Enter amount of cycle"/>
 
</form>
 
</body>
</html>