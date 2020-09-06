<%-- 
    Document   : footer
    Created on : Aug 12, 2020, 12:50:41 AM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Footer</title>

        <style>
            .footer {
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #3282B8;
                color: white;
                text-align: center;
                padding-top: 20px;
                padding-bottom: 5px;
            }
            .footerinfo {
                list-style: none;
                color: white;
            }
            .footerinfo li{
                padding-bottom: 5px;
               font-style: italic; 
            }
            .footerinfo p{
               font-style: italic; 
            }
            .footerchecked {
                color: gold;
            }
        </style>

    </head>

    <body>
        <footer class="footer ">
            <div class="container">
                <span>
                    <div class="footerinfo">
                        <div class="row">
                            <div class="col-sm-4">
                                <h4>BoatBnB</h4>
                                <li><a class="footerinfo" href="/aboutus">About</a></li>
                                <li><a class="footerinfo" href="/contactus">Contact Us</a></li>
                                <li><a class="footerinfo" href="chatpage">Join the Discussion</a></li>
                            </div>
                            <div class="col-sm-4">
                                <h4>Information</h4>
                                <li><a class="footerinfo" href="/preregisterboat">Register Your Boat</a></li>
                                <li><a class="footerinfo" href="/showallboats">All boats</a></li>
                                <li><a class="footerinfo" href="/#">Reviews&nbsp; <span class="fa fa-star footerchecked"></span></a></li>
                            </div>
                            <div class="col-sm-4">
                                <h4>Do you need help?</h4>
                                <p><a class="footerinfo" href="/#"><i class="material-icons">&#xe0be;</i><br>
                                        info@BoatBnB.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <i class="fa fa-facebook-square fa-3x" aria-hidden="true"></i>
                        <i class="fa fa-twitter-square fa-3x" aria-hidden="true"></i>
                        <i class="fa fa-linkedin-square fa-3x" aria-hidden="true"></i>

                    </div>
                    <p> &copy BNB-ShipPort Group Project Copyright 2020</p>
                </span>
            </div>
        </footer>

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
