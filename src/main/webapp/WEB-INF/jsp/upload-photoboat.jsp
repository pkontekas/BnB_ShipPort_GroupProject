<%-- 
    Document   : upload-photoboat
    Created on : Aug 18, 2020, 5:55:24 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Upload Boat photos</h1>
        <form enctype="multipart/form-data" action="/uploadphotoboat" method="POST">
            <input type="file" name="boatphoto">
            <input type="submit">
        </form>
    </body>
</html>
