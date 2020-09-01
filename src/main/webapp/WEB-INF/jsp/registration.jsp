<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
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
                padding-bottom: 40px;
                padding-top: 30px;
            }
            .titleRegistration{
                padding-top: 20px;
                text-align: center;
            }
        </style>

    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <h1 class="titleRegistration">User Registration</h1>
        <div class="form container"> 

            <springform:form cssClass="main-form needs-validation" novalidate="true" action="doinsertaccount" method="POST" modelAttribute="newaccount" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="name">First Name<small class="text-muted"> (required)</small></label>
                            <springform:input type="text" path="name" cssClass="form-control" id="name" pattern="[A-Za-z]+" required="true"/>
                            <div class="invalid-feedback">Use only alphabetic characters.</div>
                        </div>
                        <div class="form-group">
                            <label for="cellphone">Cellphone Number</label>
                            <springform:input type="number" path="cellphone" min="0" cssClass="form-control" id="cellphone"/>
                        </div>
                        <div class="form-group">
                            <label for="nationality">Preferred Language</label>
                            <springform:select type="text" required="true" path="nationality" cssClass="form-control">
                                <springform:option selected="true"  value="English">English</springform:option>
                                <springform:option value="Greek">Greek</springform:option>
                            </springform:select>
                        </div>
                        <div class="form-group">
                            <label for="firstUserPass">Password<small class="text-muted"> (required)</small></label>
                            <springform:input type="password" path="password" cssClass="form-control" id="firstUserPass" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required="true"/>
                            <div class="invalid-feedback">Minimum eight characters, at least one letter and one number.</div>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="surname">Last Name<small class="text-muted"> (required)</small></label>
                            <springform:input type="text" path="surname" cssClass="form-control" id="surname" pattern="[A-Za-z]+" required="true"/>
                            <div class="invalid-feedback">Use only alphabetic characters.</div>
                        </div> 
                        <div class="form-group">
                            <label for="email">E-mail<small class="text-muted"> (required)</small></label>
                            <springform:input type="email" path="email" cssClass="form-control" id="email" required="true"/>
                            <div class="invalid-feedback">Email format required</div>
                        </div>
                        <div class="form-group">
                            <springform:label path="profilePic">Upload Photo</springform:label>
                                <input type="file" name="profilepic" class="form-control"/>
                        </div>
                            <div class="form-group">
                                <label for=""> &nbsp; </label>
                                <input type="password" class="form-control" placeholder="Repeat pass" name="secondpass" id="secondUserPass" required><br>
                            </div>  
                        </div> 
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                        <label class="form-check-label" for="exampleCheck1">Terms & Conditions</label>
                    </div>
                    <button type="Submit" value="Submit" class="btn btn-primary">Submit</button>
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
</html>