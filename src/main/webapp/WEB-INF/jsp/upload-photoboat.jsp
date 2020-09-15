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

        <style>
              html, body {
                height: 100%;
            }
            .wrapper {
                min-height: 100%;
                margin-bottom: -269px;
                padding-bottom: 269px;
            }
            .fontClass
            {
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
            }
            uploadTitle{
                padding-top: 20px;
                padding-bottom: 30px;
            }
        </style>

    </head>
    <body>
        <div class="wrapper">
        <jsp:include page="navbar.jsp"/>

        <div class="fontClass text-center justify-content-center">
            <h1 class="uploadTitle">Upload Boat photo</h1>
            <springform:form id="imageForm" enctype="multipart/form-data" action="/uploadphotoboat" method="POST">
                <label for ="photoboat">Upload a photo for your boat:<small class="text-muted"> (required)</small><label>
                        <input id="fileChooser" type="file" name="photoboat" accept="image/*" onchange="return ValidateFileUploadIsPic()" required>
                        <button type="Submit" value="Submit" onclick="submitted = true;">Submit</button>
                        <div class="mx-auto mt-3">
                            <img class="h-50 w-50 img-fluid rounded mx-auto d-block" src="image/defaultBoatPic.jpg" id="blah">
                        </div>
                        <input hidden type="number" name="boatid" value="${myboat.id}">
                    </springform:form>
                    </div>
</div>
                    <jsp:include page="footer.jsp"/>

                    <script>
                        // Warning before leaving the page (back button, or outgoinglink)
                        var submitted = false;
                        window.onbeforeunload = function () {
                            if (!submitted)
                                return "Are you sure you want to leave the page before submitting Boat Photo?";
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
                    <script src="/js/validations.js"></script>
                    </body>
                    </html>