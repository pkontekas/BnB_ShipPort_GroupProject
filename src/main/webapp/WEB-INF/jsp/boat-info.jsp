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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
                padding-top: 20px;
                padding-bottom: 20px;
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
            <h1> ${boatdetails.boatType} ${boatdetails.manufacturer} ${boatdetails.model} in ${boatdetails.portsId.city}, ${boatdetails.portsId.portName}</h1>

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
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-8 text-center">
                    <h5>Time to sail!</h5>
                    <img alt="boatimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${boatimage}"/>
                    <h4>Boat information</h4>
                    <h5>Rent this incredible ${boatdetails.boatType} and enjoy the beaches around ${boatdetails.portsId.city}</h5>
                    <p> <b>Safe & Clean.</b> The owner of this boat has promised to comply with the safety and hygiene measures ordered by the local authorities, and to follow PortBNB's recommendations for the prevention of the coronavirus. <br>
                    </p>
                    <p> Sail with your family in the comfort of this great ${boatdetails.boatType} and enjoy a day full of relaxation and fun in one of the best natural scenery in the world.<br><br>

                        This versatile ${boatdetails.boatType} is ideal for adults and children. <br>
                        You can leave from ${boatdetails.portsId.portName} to sail in the bay and witness the spectacular beauty of marine life while snorkeling accompanied by an expert guide.<br><br>
                        Live the adventure of the day and enjoy the Beautiful Sea like never before! <br>
                    </p>
                    <div class="text-left">
                        <p>
                            <b>Terms</b><br>
                        <ul>Mandatory extras</ul>
                        <li>Docking fee when boarding : $12 per person per day</li><br>
                        <ul>Timetable</ul>
                        <li>For day charters check-in starts from 8:00 h.</li>
                        <li>For day charters check-out is until 13:00 h.</li><br>
                        <ul>Base port</ul>
                        <li>The Mooring at the base port is included</li>
                        <li>The boat must return to the home port every night</li>
                        <li>There is no overnight stay on board the boat</li><br>
                        <ul>Other conditions</ul>
                        <li>Second payment is due one month before charter</li>
                        <li>If the charter is not possible because of severe weather conditions you will be offered an alternative day. If no other date can be found, you will get a full refund.</li>
                        <br>
                        All prices include tax.
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-4">
                    <h5 class="text-center">${boatdetails.portsId.portName} Port</h5>
                    <img alt="portimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${portimage}"/>
                    <div class="request">
                        <div class="text-center">
                            <p>from ${boatdetails.currentPrice} &euro; per day <br>from ${boatdetails.currentPrice*7} &euro; per week</p>
                            <button type="submit" class="searchBtn btn-primary" style="width: 100%;"><i
                                    class="fa fa-search"></i>&nbsp;
                                Request an Offer &nbsp;</button>
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
                        <li>Boat Type: ${boatdetails.boatType}</li>
                        <li>Length (ft): ${boatdetails.boatLength}</li>
                        <li>Passenger Capacity: ${boatdetails.passengerCapacity}</li>
                        <li>No. of Beds: ${boatdetails.beds}</li>
                        <li>Engine Power: ${boatdetails.enginePower}</li>
                        <li>Fuel Type: ${boatdetails.fuel}</li>
                        <li>Fuel Tank Capacity: ${boatdetails.fuelTankCapacity}</li>
                        <li>Cruise Speed: ${boatdetails.cruiseSpeed}</li>
                        <li>Max Speed: ${boatdetails.maxSpeed}</li>
                        <li>City: ${boatdetails.portsId.city}</li>
                        <li>Port: ${boatdetails.portsId.portName}</li>
                        <li id="boatPricePerDay" value="${boatdetails.currentPrice}">Price: ${boatdetails.currentPrice}</li>
                    </div>
                    <button type="submit" class="searchBtn btn-primary" style="width:100%;"><i
                            class="fa fa-search"></i>&nbsp;
                        Request an Offer &nbsp;</button>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <div class="ownerContact">
                        <img src="data:image/jpeg;base64,${ownerimage}" class="mt-4 rounded-circle img-fluid w-75 mx-auto d-block" alt="ownerPic">
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
                        <h5>General Maintenance</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:10%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Cleanliness</h5>
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