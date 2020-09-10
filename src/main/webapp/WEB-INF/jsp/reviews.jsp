<%-- 
    Document   : reviews
    Created on : Sep 10, 2020, 8:19:55 PM
    Author     : Dionisis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>JSP Page</title> 
        <style>
            .bookingMessage {
                background-color: white;
                border: 1px #0f4c75 solid;
                margin-top: 25px;
                text-align: center;
                padding: 25px;
                box-shadow: 5px 10px lightgray;
                border-radius: 10px;
                text-align: justify;
            }

            .reviewStar{
                color: gold;
                padding-bottom: 15px;
            }
            .reviewPageTitle{
                text-align: center;
                padding-top: 20px;
                
            }
        </style>

    </head>
    <body style="background-color:whitesmoke;">
        <jsp:include page="navbar.jsp"/>
        <div class="container" style="padding-bottom: 30px;">
            <h1 class="reviewPageTitle">
                Reviews wall
            </h1>
            <div class="row">
                <div class="col-4">
                    <div class="bookingMessage">
                        <h2 >Dionisis</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Definitely rent a boat to do the island beaches. It is very difficult to drive on the island
                            and taxi’s are not easy to come by unless your hotel sets them up. Boats can take you to private
                            remote beaches where you don’t have 2,000 chairs piled together and music booming in the
                            background!</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Philip</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Markos</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>We went by boat to have lunch in Juan y Andrea. It’s a nice beach in formentera
                            (you can have lunch there). The place looks very casual but apparently it’s the best
                            place to have lunch by the beach in Formentera. After trying it, I can truly say that it
                            was an amazing lunch experience, on the expensive side a bit but mouth-watering food. </p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Alex </h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Theodor</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                </div>
                <div class="col-4">
                    <div class="bookingMessage">
                        <h2>Maria</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Gerasimos</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>We went by boat to have lunch in Juan y Andrea. It’s a nice beach in formentera
                            (you can have lunch there). The place looks very casual but apparently it’s the best
                            place to have lunch by the beach in Formentera. After trying it, I can truly say that it
                            was an amazing lunch experience, on the expensive side a bit but mouth-watering food. </p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Eua</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Nick</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>We went by boat to have lunch in Juan y Andrea. It’s a nice beach in formentera
                            (you can have lunch there). The place looks very casual but apparently it’s the best
                            place to have lunch by the beach in Formentera. After trying it, I can truly say that it
                            was an amazing lunch experience, on the expensive side a bit but mouth-watering food. </p>
                    </div>

                </div>
                <div class="col-4">
                    <div class="bookingMessage">
                        <h2>George</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>We went by boat to have lunch in Juan y Andrea. It’s a nice beach in formentera
                            (you can have lunch there). The place looks very casual but apparently it’s the best
                            place to have lunch by the beach in Formentera. After trying it, I can truly say that it
                            was an amazing lunch experience, on the expensive side a bit but mouth-watering food. </p>
                    </div>
                    <div class="bookingMessage">
                        <h2 >Takis</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Definitely rent a boat to do the island beaches. It is very difficult to drive on the island
                            and taxi’s are not easy to come by unless your hotel sets them up. Boats can take you to private
                            remote beaches where you don’t have 2,000 chairs piled together and music booming in the
                            background!</p>
                    </div>
                    <div class="bookingMessage">
                        <h2>Orfeas</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Visiting all the little towns was most enjoyable. Relaxing on the bow of the boat was also
                            one of my favorite things .</p>
                    </div>
                    <div class="bookingMessage">
                        <h2 >Andreas</h2>
                        <div class="reviewStar">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                        </div>
                        <p>Definitely rent a boat to do the island beaches. It is very difficult to drive on the island
                            and taxi’s are not easy to come by unless your hotel sets them up. Boats can take you to private
                            remote beaches where you don’t have 2,000 chairs piled together and music booming in the
                            background!</p>
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
