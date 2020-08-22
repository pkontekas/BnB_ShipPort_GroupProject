<%-- 
    Document   : index
    Created on : Aug 2, 2020, 8:00:40 PM
    Author     : pkontekas
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
        <title>JSP Page</title>
        <style>
            body {
                margin: 0px;
                background-color: whitesmoke;
            }
            .img {
                height: 150px;
                width: 250px;
                display: flex;
                justify-content: center;

            }

            .myVideo {

                display: flex;
                justify-content: center;


            }

            .firstMessage {
                padding: 25px;
                background-color: white;
                color: #0f4c75;
                text-align: center;
            }

            .search {
                padding-bottom: 25px;
                padding-right: 45px;
                padding-top: 15px;
                padding-left: 45px;
                width: 1000px;
                background-color: #3282B8;
                color: white;
                margin: 20px;
                left: 5px;
                border-radius: 10px;
            }

            .searchPosition {
                display: flex;
                justify-content: center;


            }

            .tPort {
                position: absolute;
                top: 8px;
                left: 16px;
                color: white;

            }

            .tBoat {
                position: absolute;
                top: 8px;
                left: 16px;
                color: white;
            }





            .popularBoat {
                background-color: white;
                text-align: center;
                color: #0f4c75;
                margin-bottom: 30px;

            }

            .popularPort {
                text-align: center;
                color: #0f4c75;
                margin-bottom: 30px;
                margin-top: 30px;
            }

            .port {
                margin-bottom: 30px;

            }

            .romantic {
                margin-bottom: 0;
                background-color: white;
                padding-left: 350px;

            }

            .romanticMessage {
                margin-top: 40px;
                margin-left: 40px;
                color: #0f4c75;
            }

            #sunsetBoat {
                border-radius: 50%;
            }
            .headerBoat{
                text-align: center;
                padding-bottom: 40px;
                margin-top: 0px;
            } 
        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="firstMessage jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-5">Welcome to BoatBnB</h1>
                <p class="lead">Discover and live the experience...</p>
            </div>
        </div>

        <div class="myVideo">
            <video autoplay muted loop>
                <source src="image/untitled.mp4" type="video/mp4">
            </video>

        </div>

        <div class="searchPosition container">
            <div class="search">
                <form>
                    <div class="form-row">
                        <div class="col-4">
                            <label for="">Where would you like to go?</label>
                            <input type="text" class="form-control" placeholder="Port,Town">
                        </div>
                        <div class="col-3">
                            <label for="">Duration</label>
                            <input type="text" min="0" class="form-control" placeholder="Any">
                        </div>
                        <div class="col-3">
                            <label for="">Start Date</label>
                            <input type="date" class="form-control" placeholder="Start Date">
                        </div>
                        <div class="col-2">
                            <label for="">&nbsp;</label>
                            <button type="button" class="btn btn-primary form-control"><i class="fa fa-search"></i>&nbsp;
                                Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="popularBoat jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class=" headerBoat display">The ideal boat for you</h1>

            </div>
            <div class="row">
                <div class="col-sm-3">
                    <a href="">
                        <h5 class="tBoat">Rib Boat</h5><img class="img" src="image/rib.jpg" alt="">
                    </a>
                </div>
                <div class="col-sm-3">
                    <a href="">
                        <h5 class="tBoat">Catamaran</h5><img class="img" src="image/catamaran.jpg" alt="">
                    </a>
                </div>
                <div class="col-sm-3">
                    <a href="">
                        <h5 class="tBoat">Motorboat</h5><img class="img" src="image/motorboat.jpg" alt="">
                    </a>
                </div>
                <div class="col-sm-3">
                    <a href="">
                        <h5 class="tBoat">Yacht</h5> <img class="img" src="image/yacht.jpg" alt="">
                    </a>
                </div>
            </div>

        </div>


        <h1 class="popularPort">Popular destinations</h1>
        <div class="port row">
            <div class="col-sm-3">

                <a href="">
                    <h5 class="tPort">Piraeus</h5><img class="img" src="image/piraeusPort.jpg" alt="">
                </a>
            </div>
            <div class="col-sm-3">

                <a href="">
                    <h5 class="tPort">Paros</h5><img class="img" src="image/parosPort.jpg" alt="">
                </a>
            </div>
            <div class="col-sm-3">

                <a href="">
                    <h5 class="tPort">Mykonos</h5> <img class="img" src="image/mykonosPort.jpg" alt="">
                </a>
            </div>
            <div class="col-sm-3">

                <a href="">
                    <h5 class="tPort">Heraklion</h5><img class="img" src="image/heraklionPort.jpg" alt="">
                </a>
            </div>
        </div>
        <div class="romantic jumbotron jumbotron-fluid">
            <div class="row">

                <div class="col-sm-3 ">
                    <img id="sunsetBoat" src="image/sunsetonboat.jpg" alt="">
                </div>

                <div class="romanticMessage col-sm-4">
                    <h1 class="display-6">Discover the world</h1>
                    <p class="lead">And live the moment . .
                    </p>
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
