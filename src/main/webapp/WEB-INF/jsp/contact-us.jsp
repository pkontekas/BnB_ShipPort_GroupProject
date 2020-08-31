<%-- 
    Document   : contact-us
    Created on : Aug 27, 2020, 10:31:16 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <title>Contact Us Page</title>

        <style>
          
            .titleContact{
                text-align: center;
                padding: 30px;
            }
            .profileCards{
                padding-bottom: 100px;
            }
            .title {
                text-align: center;
                color: grey;
                font-size: 18px;
            }

            .btncontact {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
            }

            .anchors {
                text-decoration: none;
                font-size: 22px;
                color: black;
            }

            .btncontact:hover, a:hover {
                opacity: 0.7;
            }
            .cardText{
                text-align: center;
                margin: 10%;
            }
        </style>

    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="titleContact">
            <h1>Contact us</h1>
        </div>
        <div class="profileCards container-fluid">
            <div class="row">
                
                <div class="profile col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <div class="cardText">
                        <img src="image/dionisis.jpg" alt="Philip" style="width:100%">
                        <h1>Philip Kontekas</h1>
                        <p class="title">Junior Full Stack Developer </p>
                        <p>email address<br> phkontekas@gmail.com</p>
                        <div>
                            <a class="anchors" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-linkedin"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="anchors" href="#"> <i class="fa fa-github"></i></a>
                        </div>
                        <p><button class="btncontact">Contact</button></p>
                    </div>
                </div>
                
                
                   <div class="profile col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <div class="cardText">
                        <img src="image/dionisis.jpg" alt="Philip" style="width:100%">
                        <h1>Dionisis Tsilioris</h1>
                        <p class="title">Junior Full Stack Developer </p>
                        <p>email address<br> diontsilioris@gmail.com</p>
                        <div>
                            <a class="anchors" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-linkedin"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="anchors" href="#"> <i class="fa fa-github"></i></a>
                        </div>
                        <p><button class="btncontact">Contact</button></p>
                    </div>
                </div>
                   <div class="profile col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <div class="cardText">
                        <img src="image/Pantazis.jpg" alt="Markos" style="width:100%;">
                        <h1>Markos Pantazis</h1>
                        <p class="title">Junior Full Stack Developer </p>
                        <p>email address<br> markpantazis@gmail.com</p>
                        <div>
                            <a class="anchors" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-linkedin"></i></a>
                            <a class="anchors" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="anchors" href="#"> <i class="fa fa-github"></i></a>
                        </div>
                        <p><button class="btncontact">Contact</button></p>
                    </div>
                </div>
            </div>
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