<%-- 
    Document   : navbar
    Created on : Aug 11, 2020, 9:25:39 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Navbar</title>
    </head>

    <style>
        .navbar {
            padding: 20px;
            background-color :#3282B8 ;
            color: white;
        }
        .navbar a,
        .navbar a:hover,
        .navbar a:visited {
            color: white;
        }
        .dropdown-menu{
            background-color: #3282B8;
        }
        #drop:hover{
            color: #3282B8;
        }
    </style>

    <body>
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="/"><img src="image/logo.jpg" style="height: 50px;"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars" style="background-color: white;"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/api/allboats">JSON</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/showallboats">All boats</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/preregisteraccount">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/preregisterboat">Boat Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" data-toggle="modal" data-target="#loginmodal">Login</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            My account
                        </a>
                        <div class="dropdown-menu" style="background-color: #3282B8 " aria-labelledby="navbarDropdownMenuLink">
                            <a id="drop" class="dropdown-item" href="/myprofile">Profile </a>
                            <a id="drop" class="dropdown-item" href="<c:url value="/performlogout"/>">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div>
            <c:if test="${param.logout != null}">
                <i>You successfully logged out!!!</i>
            </c:if>
            <c:if test="${param.error != null}">
                <i>Invalid username and password</i>
            </c:if>   
        </div>

        <div id="loginmodal" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <springform:form method="POST" action="${pageContext.request.contextPath}/performlogin">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" name="email" autocomplete="on" class="form-control" id="logemail" required
                                       aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                    else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" autocomplete="off" class="form-control" required
                                       id="navpassword">
                                <a href="#">forgot my password</a>
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="remember">
                                <label class="form-check-label" for="check">Remember me</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="Submit" name="Submit" class="btn btn-primary">Sign in</button>
                        </div>
                    </springform:form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

    </body>
</html>