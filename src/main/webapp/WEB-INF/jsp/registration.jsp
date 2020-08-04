<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <h1>User Account Registration</h1>
        <form:form action="doinsertaccount" method="post" modelAttribute="newaccount">
            <label for="language">Preferred Language</label><br>
            <form:input type="text" path="language" id="language" required="true" value="English"/><br>
            <label for="name">First Name</label><br>
            <form:input type="text" path="name" id="name" required="true"/><br>
            <label for="cellphone">Cellphone Number</label><br>
            <form:input type="text" path="cellphone" id="cellphone"/><br>
            
            <!--TO DO maybe change cellphone to number on above line, and add profile pic field at some point-->
            <label for="profilePic">Profile Picture</label><br>
            <form:input type="file" path="profilePic" id="profilePic"/><br>
            <label for="surname">Last Name</label><br>
            <form:input type="text" path="surname" id="surname" required="true"/><br>
            <label for="email">Email</label><br>
            <form:input type="email" path="email" id="email" required="true"/><br><br>
            <label for="password">Password</label>
            <form:password id="password" path="password" required="true"/><br>
            <label for="password">Password</label>
            <input type="password" placeholder="Repeat pass" name="secondpass"/><br>
            <form:button type="Submit">Register</form:button>    
        </form:form>
    </body>
</html>