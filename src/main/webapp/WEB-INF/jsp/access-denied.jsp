<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Access Denied</title>
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
                padding-top: 150px;
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
        <jsp:include page="navbar.jsp"/>

        <div class="fontClass text-center">
            <h3>No access on this page sorry. <br>This is Spring Security.<br>
                Wait while we redirect you back to our Site, or click the next Link.
            </h3>
            <a href="${pageContext.request.contextPath}/">Go to Main Page</a>
        </div>
</div>
        <jsp:include page="footer.jsp"/>

        <script>
            setTimeout(function () {
                document.location = "/";
            }, 8000); // <-- this is the delay in milliseconds
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