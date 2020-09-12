<%-- 
    Document   : login
    Created on : Aug 29, 2020, 12:09:58 AM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>Login</title>
    </head>

    <style>
        .loginForm {
            display: flex;
            justify-content: center;
            padding-bottom: 200px;
            padding-top: 30px;
            font-style: italic;
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-weight: 600;
        }
        .titleLogin {
            padding-top: 20px;
            text-align: center;
            font-style: italic;
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-weight: 600;
        }
        body{
            background-color: whitesmoke;
        }
    </style>

    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="text-center" style="color: green">
            Dear Visitor, <br>you will have to login to access more features!
        </div>
        <div class="container">
            <div class="titleLogin">
                <h1>Login Form</h1>
            </div>
            <div class="loginForm row">
                <div class="col-xs-11 col-sm-9 col-md-7 col-lg-6">
                    <springform:form method="POST" action="${pageContext.request.contextPath}/performlogin" cssClass="main-form needs-validation" novalidate="true">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" name="email" autocomplete="on" class="form-control" required
                                   aria-describedby="emailHelp" placeholder="johnsmith@gmail.com">
                            <div class="invalid-feedback">Email format is invalid.</div>
                            <small id="emailHelp" class="form-text text-muted mt-3">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" autocomplete="off" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
                            <div class="invalid-feedback">Minimum eight characters, Latin, at least a letter and a number.</div>
                        </div>
                        <button type="Submit" name="Submit" class="btn btn-primary">Sign in</button>
                    </springform:form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <script src="/js/validations.js"></script>
    </body>
</html>