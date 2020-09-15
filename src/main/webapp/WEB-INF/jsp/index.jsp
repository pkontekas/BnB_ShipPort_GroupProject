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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0px;
                background-color: whitesmoke;
            }
            .imgitems {
                height: 250px;
                width: 300px;
                display: flex;
                justify-content: center;
            }
            .myVideo {
                background-color: whitesmoke;
                display: flex;
                justify-content: center;
                overflow: hidden;
            }
            .firstMessage {
                padding-top: 25px;
                padding-bottom: 25px;
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
            .index4headerItems {
                position: absolute;
                top: 8px;
                left: 23%;
                color: white;
            }
            .popularBoat {
                background-color: white;
                text-align: center;
                color: #0f4c75;
                margin-bottom: 30px;
            }
            .popularPort {
                background-color: whitesmoke;
                text-align: center;
                color: #0f4c75;
                margin-bottom: 30px;
                margin-top: 30px;
                padding-top: 20px;
            }
            .port {
                padding-bottom: 50px;
            }
            .romantic {
                margin-bottom: 20px;
                background-color: white;
            }
            .romanticMessage {
                margin-top: 40px;
                color: #0f4c75;
            }
            #sunsetBoat {
                border-radius: 50%;
            }
            .headerIndex{
                text-align: center;
                margin-bottom: 60px;
                margin-top: 0px;
            } 
        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="firstMessage">
            <div class="jumbotron-fluid">
                <div class="container">
                    <h1 class="display-5">Welcome to BoatBnB</h1>
                    <p class="lead">Discover and live the experience...</p>
                </div>
            </div>
        </div>

        <div class="myVideo row container-fluid justify-content-center">
            <div class="col-sm-9">
                <div class="embed-responsive embed-responsive-16by9">
                    <video autoplay muted loop>
                        <source src="image/indexVideo.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
        </div>

        <div class="searchPosition container">
            <div class="search">
                <form id="searchForm" onSubmit="searchFormSubmit()">
                    <div class="form-row">
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                            <label for="destination">Destination</label>
                            <select name="destination" id="destPort" class="form-control">
                                <option value="any">Any</option>
                                <option value="pireaus">Piraeus</option>
                                <option value="mykonos">Mykonos</option>
                                <option value="paros">Paros</option>
                                <option value="heraklion">Heraklion</option>
                                <option value="zakynthos">Zakynthos</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                            <label for="typeBoat">Boat Type</label>
                            <select name="typeBoat" id="desttypeBoat" class="form-control">
                                <option value="all">All</option>
                                <option value="yacht">Yacht</option>
                                <option value="catamaran">Catamaran</option>
                                <option value="motorboat">Motorboat</option>
                                <option value="rib">Rib Boat</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2">
                            <label for="">&nbsp;</label>
                            <button type="submit" class="btn btn-primary form-control">
                                <i class="fa fa-search"></i>&nbsp;
                                Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <div class="popularBoat">
                <div class="jumbotron-fluid">
                    <h1 class="headerIndex display">The ideal boat for you</h1>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/any/rib">
                            <h5 class="index4headerItems">Rib Boat</h5>
                            <img class="imgitems img-fluid" src="image/rib.jpg" alt="rib">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/any/catamaran">
                            <h5 class="index4headerItems">Catamaran</h5>
                            <img class="imgitems img-fluid" src="image/catamaran1920x1200.jpg" alt="catam">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/any/motorboat">
                            <h5 class="index4headerItems">Motorboat</h5>
                            <img class="imgitems img-fluid" src="image/motorboat.jpg" alt="motor">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/any/yacht">
                            <h5 class="index4headerItems">Yacht</h5>
                            <img class="imgitems img-fluid" src="image/luxury-yacht1920x1200.jpg" alt="yacht">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="popularPort">
            <h1 class="headerIndex">Popular destinations</h1>
            <div class="container-fluid">
                <div class="port row d-flex justify-content-center">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/athens/all">
                            <h5 class="index4headerItems">Piraeus</h5>
                            <img class="imgitems img-fluid" src="image/piraeusPort.jpg" alt="peir">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/paros/all">
                            <h5 class="index4headerItems">Paros</h5>
                            <img class="imgitems img-fluid" src="image/parosPort.jpg" alt="par">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/mykonos/all">
                            <h5 class="index4headerItems">Mykonos</h5>
                            <img class="imgitems img-fluid" src="image/mykonosPort.jpg" alt="mik">
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 d-flex justify-content-center">
                        <a href="${pageContext.request.contextPath}/showallboats/heraklion/all">
                            <h5 class="index4headerItems">Heraklion</h5>
                            <img class="imgitems img-fluid" src="image/heraklion1024x683.jpg" alt="ira">
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="romantic jumbotron-fluid container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 d-flex justify-content-end">
                    <div class="d-none d-xl-block">
                        <img id="sunsetBoat" src="image/sunsetonboat.jpg" alt="sunset">
                    </div>
                </div>
                <div class="romanticMessage col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="d-none d-xl-block">
                        <h1 class="justify-content-left">Discover the world</h1>
                        <p class="lead justify-content-left ml-5">And live the moment . .</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 d-flex justify-content-center">
                    <div class="d-xl-none">
                        <img class="img-fluid" id="sunsetBoat" src="image/sunsetonboat.jpg" alt="sunset">
                    </div>
                </div>
                <div class="romanticMessage col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="d-xl-none">
                        <h1 class="d-flex justify-content-center">Discover the world</h1>
                        <p class="lead d-flex justify-content-center">And live the moment . .</p>
                    </div>
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
    <script>
                    function searchFormSubmit() {
                        //const sform = document.getElementById('searchForm');
                        event.preventDefault();
                        const portDestination = document.getElementById('destPort').value;
                        const boatType = document.getElementById('desttypeBoat').value;
                        const urlString = "/showallboats/" + portDestination + "/" + boatType;
                        window.location.replace(urlString);
                    };
    </script>
</body>
</html>
