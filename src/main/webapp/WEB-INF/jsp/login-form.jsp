<%-- 
    Document   : login-form
    Created on : Aug 3, 2020, 11:43:04 AM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
    </head>
    <body>
        <h1>Log in</h1>
        <springform:form method="POST">
            <p>
                E-mail: <input type="email" name="email"/>
            </p>
            <p>
                Password: <input type="password" name="password"/>
            </p>
            <input type="submit" value="Login"/>
            
        </springform:form>
    </body>
</html>
