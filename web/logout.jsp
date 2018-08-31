<%-- 
    Document   : logout
    Created on : Apr 23, 2018, 10:29:55 AM
    Author     : Nutan Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            fuction preventBack(){
                widow.history.forward();
            }
            setTimeout("preventBack()",10);
            window.onunload=function(){null};
        </script>
    </head>
    <body>
        <%
          //  session .invalidate();
            //response.sendRedirect("log.jsp");
        %>
        <form action="log.jsp">
            <button type="submit" > Click here</button>
        </form>
    </body>
</html>
