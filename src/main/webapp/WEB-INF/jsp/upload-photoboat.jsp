<%-- 
    Document   : upload-photoboat
    Created on : Aug 18, 2020, 5:55:24 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Boat Photo Upload</title>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>
        
        <div class="text-center justify-content-center">
            <h1>Upload Boat photo</h1><small class="text-muted"> (required)</small>
            <springform:form enctype="multipart/form-data" action="/uploadphotoboat" method="POST">
                <input type="file" name="photo" accept="image/*">
                <input hidden type="number" name="boatid" value="${myboat.id}">
                <button type="Submit" value="Submit">Submit</button>
            </springform:form>
        </div>
        
        <jsp:include page="footer.jsp"/>

        <script>
            // Warning before leaving the page (back button, or outgoinglink)
            window.onbeforeunload = function () {
                return "Please cancel and Submit a Boat Photograph first because it's mandatory and as an Boat Owner you need it.";
            };
        </script>
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
