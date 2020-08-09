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
      top: 0;
      left: 0;
      padding: 10px;
      align-items: center;
    }

    nav ul {
      display: flex;
      list-style: none;
      margin-right: 20px;
      
    
    }

    nav ul li {
      display: flex;
      align-items: center;
      margin-left: 30px;
      cursor: pointer;
     display: inline;
     

    }

    .form {
      color: #0f4c75;
      margin-left: 25%;
      padding-top: 10%;
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
      font-size: 20px;
    }
  </style>

</head>

<body>
  <div class="navbar">
    <a href="" style="color: white; margin-left: 20px;"><strong>Home</strong></a>
    <nav>
      <ul>
        <li> <a href="#" style="color: white;">All Boats</a> </li>
        <li> <a href="#" style="color: white;">Login</a></li>
        <li> <a href="#" style="color: white;">Register</a> </li>
        <div class="btn-group">
          <button style="background-color: #3282B8 ; margin-top: 0px;"  class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Small button
          </button>
          <div  class="dropdown-menu">
            <a href="">Edit profile</a>
          </div>
        </div>
      </ul>

    </nav>
  </div>

  <div class="form">
    <h1>Login</h1>
    <form class="main-form needs-validation" novalidate method="POST" action="performlogin" >

      <div class="form-group col-sm-2 col-md-3 col-xl-3 col-form-label">
        <label for="email">E-mail</label>
        <input type="email" name="email" id="email" required class="form-control">
        <div class="invalid-feedback">please enter your E-mail</div>
      </div>
      <div class="form-group col-sm-3 col-form-label ">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" required class="form-control">
        <div class="invalid-feedback">please enter password</div>
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

        <button type="submit" class="btn btn-primary" onclick=" ">Sign in</button>


      </div>
      <script>
        var form = document.querySelector('.needs-validation');
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        })
      </script>

</form>

  </div>

  <div class="footer">
    &copy 2020;
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