<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Registration</title>
        <style>

            .form {
                display: flex;
                justify-content: center;
            }

        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="form container">
            <form:form action="doinsertaccount" method="POST" modelAttribute="newaccount" enctype="multipart/form-data">
                <h1>User Registration</h1>
                <div class="form-group col-16">
                    <label for="nationality">Preferred Language</label>
                    <input type="text" path="nationality" id="nationality" class="form-control" required value="English">
                </div>
                <div class="form-group col-16 ">
                    <label for="name">First Name</label>
                    <input type="text" path="name" class="form-control" id="name" required>
                </div>
                <div class="form-group col-16 ">
                    <label for="surname">Last Name</label>
                    <input type="text" path="surname" class="form-control" id="surname" required>
                </div>
                <div class="form-group col-16">
                    <label for="cellphone">Cellphone Number</label>
                    <input type="text" path="cellphone" class="form-control" id="cellphone">
                </div>
                <div class="form-group col-16">
                    <label for="profilepic">Upload Photo</label>
                    <input type="file" path="profilepic" class="form-control" id="profilepic" >
                </div>
                <div class="form-group col-16 ">
                    <label for="email">E-mail</label>
                    <input type="email" path="email" class="form-control" id="email" required>
                    <div class="invalid-feedback">please enter your E-mail</div>
                </div>
                <div class="form-group col-16">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password">

                    <label for="secondpass"></label>
                    <input type="password" class="form-control" placeholder="Repeat pass" name="secondpass" required/><br><br>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                    <label class="form-check-label" for="exampleCheck1">Terms & Conditions</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
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
    </body>
</body>
</html>