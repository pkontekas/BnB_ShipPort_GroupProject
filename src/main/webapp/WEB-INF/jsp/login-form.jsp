<%-- 
    Document   : login-form
    Created on : Aug 3, 2020, 11:43:04 AM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
    </head>
    <body>
        <h1>Log in Form</h1>
<%--
        <c:if test="${param.error != null}">
            <b>Sorry you entered wrong credentials. Try again!!!</b>
        </c:if>
        <c:if test="${param.logout != null}">
            <b>You have successfully logged out!!!!</b>
        </c:if>
--%>
            
        <springform:form method="POST" action="performlogin">
            <p>
                E-mail: <input type="email" name="email" required="true"/>
            </p>
            <p>
                Password: <input type="password" name="password" required="true"/>
            </p>
            <input name="Submit" type="Submit" value="Submit"/>
        </springform:form>

        <a href="preregisteraccount">Register</a>
    </body>
</html>
