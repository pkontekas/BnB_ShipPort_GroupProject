<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Registration</title>

        <style>
            .regform {
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
                display: d-flex;
                justify-content: center;
                padding-bottom: 40px;
                padding-top: 30px;
            }
            .titleRegistration{
                padding-top: 20px;
                text-align: center;
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }
            .rederror{
                color: red;
            }
        </style>

    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <h1 class="titleRegistration">User Registration</h1>
        <div class="regform container"> 

            <springform:form cssClass="main-form needs-validation" novalidate="true" action="doinsertaccount" method="POST" modelAttribute="newaccount" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="name">First Name<small class="text-muted"> (required)</small></label>
                            <springform:input path="name" id="name" cssClass="form-control" pattern="[A-Za-z]+" minlength="3" required="true"/>
                            <div class="invalid-feedback">Use only Latin, alphabetic and at least 2 characters.</div>
                        </div>
                        <div class="form-group">
                            <label for="cellphone">Cellphone Number<small class="text-muted"> (optional)</small></label>
                            <springform:input type="number" path="cellphone" min="0" maxlength="9" cssClass="form-control" id="cellphone"/>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail<small class="text-muted"> (required) <br><div class="rederror font-italic">${mailerror}</div></small></label>
                                    <springform:input type="email" path="email" cssClass="form-control" id="email" required="true" placeholder="johnsmith@gmail.com"/>
                            <div class="invalid-feedback">Email formatting required</div>
                        </div>
                        <div class="form-group">
                            <label for="firstUserPass">Password<small class="text-muted"> (required) <br><div class="rederror font-italic">${passerror}</div></small></label>
                                    <springform:password autocomplete="off" path="password" cssClass="form-control" id="firstUserPass" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required="true"/>
                            <div class="invalid-feedback">Minimum eight characters, Latin, at least a letter and a number.</div>
                        </div>
                        <div class="form-group">
                            <label for="repeatpassword">Reenter Password<small class="text-muted"> (required)</small></label>
                            <div class="input-group">
                                <input type="password" autocomplete="off" class="form-control" id="repeatpassword" placeholder="Repeat password" name="secondpass" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required><br>
                                <div class="input-group-append">
                                    <div class="form-group-text">
                                        <button style="background-color: lightgray;" class="btn" onclick="repeatpswView()">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>  
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck2" required>
                            <label class="form-check-label" for="exampleCheck2">Terms & Conditions</label>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="surname">Last Name<small class="text-muted"> (required)</small></label>
                            <springform:input path="surname" cssClass="form-control" id="surname" minlength="3" pattern="[A-Za-z]+" required="true"/>
                            <div class="invalid-feedback">Use only Latin, alphabetic and at least 2 characters.</div>
                        </div> 
                        <div class="form-group">
                            <label for="nationality">Preferred Language</label>
                            <springform:select type="text" required="true" path="nationality" cssClass="form-control">
                                <springform:option selected="true" value="English">English</springform:option>
                                <springform:option value="Greek">Greek</springform:option>
                            </springform:select>
                        </div>
                        <div class="form-group">
                            <label for="profilepic">Upload Photo<small class="text-muted"> (optional)</small></label>
                            <input id="fileChooser" type="file" name="profilepic" class="form-control" accept="image/*" onchange="return ValidateFileUploadIsPic()">
                            <div class="mx-auto mt-3">
                                <img class="h-50 w-50 img-fluid rounded-circle mx-auto d-block" src="image/defaultProfilePic.png" id="blah">
                            </div>
                        </div>
                    </div> 
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
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
        <script src="/js/validations.js"></script>
        <script src="https://cdn.rawgit.com/PascaleBeier/bootstrap-validate/v2.2.0/dist/bootstrap-validate.js"></script>
        <script>
                                function repeatpswView() {
                                    let bpass = document.getElementById("repeatpassword");
                                    if (bpass.type === "password") {
                                        bpass.type = "text";
                                    } else {
                                        bpass.type = "password";
                                    }
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
        </script>
    </body>
</html>
