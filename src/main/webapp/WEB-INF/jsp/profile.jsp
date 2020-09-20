<%-- 
    Document   : profile
    Created on : Aug 28, 2020, 11:38:32 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Update My Profile</title>

        <style>
            html, body {
                height: 100%;
            }
            .wrapper {
                min-height: 100%;
                margin-bottom: -250px;
                padding-bottom: 250px;
            }
            .profileform {
                display: flex;
                justify-content: center;
                padding-bottom: 40px;
                padding-top: 30px;
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
            }
            .updateRegistration{
                padding-top: 20px;
                text-align: center;
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }
            .errorMsg{
                color:red;
            }
            .successMsg{
                color:green;
            }
        </style>

    </head>
    <body>

        <jsp:include page="navbar.jsp"/>
        <div class="errorMsg font-italic text-center">
            ${passerror}
        </div>
        <div class="font-weight-bold text-center successMsg">
            ${upresult}
        </div>
        <h1 class="updateRegistration">Update My Profile</h1>
        <div class="wrapper profileform container pb-2 mb-2"> 
            <springform:form cssClass="main-form needs-validation" novalidate="true" action="doupdateaccount" modelAttribute="oldaccount" method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="name">First Name<small class="text-muted"> (required)</small></label>
                            <springform:input path="name" cssClass="form-control" minlength="2" pattern="[A-Za-z]+" required="true"/>
                            <div class="invalid-feedback">Use only Latin, alphabetic and at least 2 characters.</div>
                        </div>
                        <div class="form-group">
                            <label for="cellphone">Cellphone Number<small class="text-muted"> (optional)</small></label>
                            <springform:input type="number" path="cellphone" min="0" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="nationality">Preferred Language</label>
                            <springform:select type="text" required="true" path="nationality" cssClass="form-control">
                                <springform:option selected="true" value="English">English</springform:option>
                                <springform:option value="Greek">Greek</springform:option>
                            </springform:select>
                        </div>
                        <div class="form-group">
                            <label for="oldpass">Current Password<small class="text-muted"> (required)</small></label>
                            <input type="password" autocomplete="off" class="form-control" name="oldpass" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
                            <div class="invalid-feedback">Invalid password.</div>
                        </div>
                        <div class="form-group">
                            <label for="">New Password<small class="text-muted"> (optional)</small></label>
                            <springform:password autocomplete="off" path="password" minlength="8" cssClass="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"/>
                            <div class="invalid-feedback">Minimum eight characters, Latin, at least a letter and a number.</div>
                            <small class="form-text text-muted">Only enter if you want to change it.</small>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="surname">Last Name<small class="text-muted"> (required)</small></label>
                            <springform:input path="surname" cssClass="form-control" minlength="2" pattern="[A-Za-z]+" required="true"/>
                            <div class="invalid-feedback">Use only Latin, alphabetic and at least 2 characters.</div>
                        </div> 
                        <springform:input type="hidden" path="email" cssClass="form-control" required="true"/>
                        <springform:input type="hidden" path="id"/>
                        <springform:input type="hidden" path="rolesId"/>
                        <div class="form-group">
                            <label for="profilepic">Upload Photo<small class="text-muted"> (optional)</small></label>
                            <input type="file" name="profilepic" class="form-control" accept="image/*">
                            <small class="form-text text-muted">Please upload a valid photo if you are a Ship Owner.</small>
                        </div>
                        <div class="text-center form-group">
                            <label for="oldprofilepic">Current Photo</label>
                            <img class="img-fluid rounded-circle mx-auto d-block" style="max-height:200px;" alt="noUserProfilePic" src="data:image/jpeg;base64,${oldprofilepic}"/>
                            <div class="errorMsg font-italic text-center">
                                ${profpicmissing}
                            </div>
                        </div>
                    </div> 
                </div>
                <button type="Submit" class="btn btn-primary">Update Profile</button>
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
    </body>
</html>
