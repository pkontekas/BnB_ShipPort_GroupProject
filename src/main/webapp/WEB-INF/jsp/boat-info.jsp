<%-- 
    Document   : boat-info
    Created on : Aug 8, 2020, 1:52:04 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Show info per boat</title>
        <style>
            .titlePage {
                text-align: center;
                padding-bottom: 20px;
                padding-top: 15px;
            }
            .checked {
                color: gold;
            }
            .star {
                color: gold;
            }

            .viewPage {
                display: flex;
                justify-content: center;
            }

            .ownerContact {
                border-radius: 120%;
                height: 340px;
                margin-bottom: 10px;
                padding-top: 5px;
            }

            .boatInfo {
                padding-top: 20px;
                padding-bottom: 30px;
                text-align: center;
                list-style: none;
            }

            .boatInfo li {
                font-size: larger;
                font-weight: 500;
            }

            .specifics {
                border-right-style: solid;
            }

            .contact li {
                list-style-type: none;
                text-align: center;
                font-weight: 500;
            }

            .request {
                background-color:  #0a9ab5;
                color:white;
                font-weight: 500;
                font-size: large;
                border: 1px solid;
                margin-top: 45px;
                text-align: center;
            }

            .ratingBar {
                border: 1px solid;
                font-family: Arial;
                margin: 0 auto;
                padding: 20px;
            }

            .progressBar {

                padding-bottom: 20px;


            }

            .heading {
                font-size: 25px;
                margin-right: 25px;
            }

            .fa {
                font-size: 25px;
            }
        </style>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="titlePage">
            <h1> ${boatdetails.boatType} ${boatdetails.manufacturer} ${boatdetails.model} in ${boatdetails.portsId.city}</h1>

            <div class="star">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
            </div>
        </div>

        <div class="viewPage container">
            <div class="row" style="border: 1px solid;">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-8">
                    <h5 style="text-align:center;">Boat Image</h5>
                    <img alt="boatimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${boatimage}"/>

                    <h4 style="text-align:center; ">Boat information</h4>
                    <p> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit officia sunt harum? Ut ipsa dolores
                        vero <br>
                        vitae expedita dolore cupiditate aliquam, aspernatur quam! Voluptatem recusandae hic beatae. </p>
                    <p> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit officia sunt harum? Ut ipsa dolores
                        vero <br>
                        vitae expedita dolore cupiditate aliquam, aspernatur quam! Voluptatem recusandae hic beatae. </p>
                    <p> Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit officia sunt harum? Ut ipsa dolores
                        vero <br>
                        vitae expedita dolore cupiditate aliquam, aspernatur quam! Voluptatem recusandae hic beatae. </p>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-4">
                    <h5 style="text-align:center;">Piraeus Port</h5>
                    <img alt="portimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${portimage}"/>

                    <div class="request">
                        <div style="text-align:center;">
                            <p>from ${boatdetails.currentPrice} &euro; per day <br>from 1500 &euro; per week</p>

                            <button type="submit" class="searchBtn btn-primary" style="width: 100%;"><i
                                    class="fa fa-search"></i>&nbsp;
                                request an offer &nbsp;</button>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="container">
            <div class="row" style="border: 1px solid;">
                <div class="specifics col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                    <div class="boatInfo">
                        <h3>Specifications</h3>
                        <li>Manufacturer: ${boatdetails.manufacturer}</li>
                        <li>Model: ${boatdetails.model}</li>
                        <li>Year: ${boatdetails.constructionYear}</li>
                        <li>Type: ${boatdetails.boatType}</li>
                        <li>Length: ${boatdetails.boatLength}</li>
                        <li>Fuel Type: ${boatdetails.fuel}</li>
                        <li>Fuel Tank Capacity: ${boatdetails.fuelTankCapacity}</li>
                        <li>Cruise Speed: ${boatdetails.cruiseSpeed}</li>
                        <li>City: ${boatdetails.portsId.city}</li>
                        <li>Port: ${boatdetails.portsId.portName}</li>

                        <li id="boatPricePerDay" value="${boatdetails.currentPrice}">Price: ${boatdetails.currentPrice}</li>
                    </div>
                    <button type="submit" class="searchBtn btn-primary" style="width:100%;"><i
                            class="fa fa-search"></i>&nbsp;
                        request an offer &nbsp;</button>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <div class="ownerContact">
                        <img src="image/dionisis.jpg" class="rounded-circle  img-fluid" alt="">
                    </div>
                    <div class="contact">
                        <li>Owner: ${boatdetails.accountsId.name} ${boatdetails.accountsId.surname}</li>
                        <li>Phone: ${boatdetails.accountsId.cellphone}</li>
                        <li>E-mail: <a href="mailto:${boatdetails.accountsId.email}">${boatdetails.accountsId.email}</a> </li>

                    </div>
                </div>
            </div>
        </div>

        <div class="ratingBar container">

            <span class="heading">User Rating</span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <p>4.1 average based on 254 reviews.</p>
            <hr style="border:3px solid #f1f1f1">


            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                    <div class="progressBar">
                        <h5>General maintenance</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>cleanliness</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Comfort</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                    <div class="progressBar">
                        <h5>Harbour</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Hospitality</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Value for money</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <iframe width="100%" height="450"
                        src="https://www.google.com/maps/embed/v1/place?q=patra&key=AIzaSyD_29tF36kHRvF7jmwjAwaQbkg39EU8CAg"
                        allowfullscreen></iframe>
            </div>
        </div>
        <div class="container">
            <div id="paypal-button-container"></div>
        </div>






        <!--        <h1>Show Boat Info</h1>
                <ul>
                    <li>Manufacturer: ${boatdetails.manufacturer}</li>
                    <li>Model: ${boatdetails.model}</li>
                    <li>Year: ${boatdetails.constructionYear}</li>
                    <li>Type: ${boatdetails.boatType}</li>
                    <li>Length: ${boatdetails.boatLength}</li>
                    <li>Fuel Type: ${boatdetails.fuel}</li>
                    <li>Fuel Tank Capacity: ${boatdetails.fuelTankCapacity}</li>
                    <li>Cruise Speed: ${boatdetails.cruiseSpeed}</li>
                    <li id="boatPricePerDay" value="${boatdetails.currentPrice}">Price: ${boatdetails.currentPrice}</li>
                    <li>Port: ${boatdetails.portsId.portName}</li>
                    <img alt="portimage" src="data:image/jpeg;base64,${portimage}"/>
                    <img alt="boatimage" src="data:image/jpeg;base64,${boatimage}"/>
                    <li>City: ${boatdetails.portsId.city}</li>
                    <li>Pay Instantly:
        
                        <div id="paypal-button-container"></div>
        
                    </li>
                </ul>
        
                <ul>
                    <li>Owner: ${boatdetails.accountsId.name} ${boatdetails.accountsId.surname}</li>
                    <li>Email: ${boatdetails.accountsId.email}</li>
                    <li>Cellphone: ${boatdetails.accountsId.cellphone}</li>
                </ul>-->

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

        <script src="https://www.paypal.com/sdk/js?client-id=AclT2R2sijDUVaf_NADn4bs6gxmUT186bz3fophkxQLEEhg60z6pioqE0Q8KPoW4in4hqZgKcyiBRWih&currency=EUR">
            // Required. Replace SB_CLIENT_ID with your sandbox client ID. </script>
        <script src="/js/paypal.js"></script>
    </body>
</html>