<%-- 
    Document   : login-form
    Created on : Aug 3, 2020, 11:43:04 AM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Login</title>
        <style>
            html {
                box-sizing: border-box;
            }

            body {
                background-image: url('image/lo.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }

            .navbar {
                background-color: #3282B8;
                position: fixed;
                display: flex;
                justify-content: space-between;
                width: 100vw;
                height: 72px;
                top: 0;
                left: 0;
                padding: 8px;
                align-items: center;
            }

            nav ul {
                display: flex;
                list-style: none;
                justify-content: space-between;
                align-items: center;
                margin-top: 1%;
            }

            nav ul li {
                display: list-item;
                margin-right: 15px;
                cursor: pointer;
            }

            a {
                color: white;
            }

            .form {
                color: #0f4c75;
                margin-left: 20%;
                padding-top: 9%;
            }

            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #3282B8;
                color: white;
                text-align: center;
                padding: 15px;
                font-size: 18px;
            }
            .bluebackground {
                background-color: #3282B8;
            }
        </style>

    </head>

    <body>
        <nav class="navbar">
            <a href="/" style="margin-left: 12px; display: block;"><strong>Home</strong></a>
            <ul>
                <li><a href="showallboats">All Boats</a></li>
                <li><a href="#">Login</a></li>
                <li><a href="preregisteraccount">Register</a></li>
                <li><div class="btn-group">
                        <button class="btn btn-secondary btn-sm dropdown-toggle bluebackground" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            myAccount
                        </button>
                        <div class="bluebackground dropdown-menu">
                            <a href="">Edit profile</a><br>
                            <a href="">Logout</a>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="container form">
            <h1>Login</h1>
            <div class="row">
                <springform:form cssClass="main-form needs-validation col-xs-9 col-sm-8 col-md-7 col-lg-7 col-xl-6" novalidate="true" method="POST" action="performlogin" >
                    <div class="form-group col-xs-9 col-sm-10 col-md-9 col-lg-8 col-xl-9 col-form-label">
                        <label for="email">Email</label>
                        <input type="email" name="email" placeholder="myemail@gmail.com" required class="form-control">
                        <div class="invalid-feedback">Please enter a valid Email address</div>
                    </div>
                    <div class="form-group col-xs-9 col-sm-10 col-md-9 col-lg-8 col-xl-9 col-form-label">
                        <label for="password">Password</label>
                        <input type="password" name="password" required class="form-control">
                        <div class="invalid-feedback">Please enter your password</div>
                    </div>
                    <!-- <div class="form-group row">
                      <div class="col-sm-10">
                        <div class="form-check">
                          <input class="form-check-input" required type="checkbox" id="gridCheck1">
                          <div class="invalid-feedback">Accept</div>
                          <label class="form-check-label"  for="gridCheck1">
                            Terms <br>& Conditions
                          </label>
                        </div>
                      </div>
                    </div> -->
                    <div>
                        <button type="Submit" name="Submit" value="Submit" class="btn btn-primary">Sign in</button>
                    </div>
                    <script>
                        var form = document.querySelector('.needs-validation');
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        });
                    </script>
                </springform:form>
            </div>
        </div>
        <div class="footer">
            &copy BNB-ShipPort Group Project Copyright 2020;
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