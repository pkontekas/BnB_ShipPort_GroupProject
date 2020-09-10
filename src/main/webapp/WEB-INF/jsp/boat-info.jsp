<%-- 
    Document   : boat-info
    Created on : Aug 8, 2020, 1:52:04 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
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
                /*                border-right-style: solid;*/
            }
            .contact li {
                list-style-type: none;
                text-align: center;
                font-weight: 500;
            }
            .request {
                background-color:#a2d5f2 ;
                color:white;
                font-weight: 500;
                font-size: large;
                margin-top: 55px;
                text-align: center;
                border-radius: 10px;
            }
            .requestbtn{
                background-color:  #3282b8 ;
                color: white;
                border-radius: 10px;
                border-color:  #3282b8;
            }
            .rate{
                /*                border: 1px solid;*/

            }
            .ratingBar {
                padding-left: 15px;
                background-color: #3282B8;
                color:white;
                font-family: Arial;
                margin: 0 auto;
                padding-top: 10px;
                padding-bottom: 10px;
                margin-top:5px;
                border-radius: 5px;
            }
            .progressBar {
                padding-bottom: 20px;
                color:#0a9ab5;
            }

            .heading {
                font-size: 25px;
                margin-right: 25px;
            }
            .fa {
                font-size: 25px;
            }

            .collapsible {
                background-color:#3282b8 ;
                color: white;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: center;
                outline: none;
                font-size: 15px;
                border-radius: 5px;
            }


            .actives, .collapsible:hover {
                background-color: #a2d5f2;
            }


            .content {
                padding: 0 18px;
                display: none;
                overflow: hidden;
                background-color: #f1f1f1;
            }
            .payment{
                border: 1px solid;
                text-align: center;
                margin-bottom: 20px;
            }
            .bookingMessage{
                border: 1px #0f4c75 solid;
                margin-top: 55px;
                text-align: center;
                color:#3282b8;
                padding: 10px;
                box-shadow: 5px 10px #3282b8;
                border-radius: 10px;
            }
            .titleImage{
                padding-top: 15px;
                padding-bottom: 15px;

            }
            .iconBoat{
                padding-top: 15px;
                padding-bottom: 15px;
            }
            .bookingForm{
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 600;
                color:#3282b8;
            }

        </style>
    </head>

    <body style="background-color:whitesmoke">

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
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 text-center">
                    <h5 class="titleImage">Time to sail!</h5>
                    <img alt="boatimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${boatimage}"/>

                    <div class="iconBoat">
                        <small class="text-muted"><i class="fa fa-users fa-3x"><br><p style="font-size:small">${boatdetails.passengerCapacity}<br>Persons </p> </i>  </small> &nbsp;
                        &nbsp;  <small class="text-muted"><i class="fa fa-bed fa-3x"><br><p style="font-size:small">${boatdetails.beds}<br>Beds </p> </i>  </small> &nbsp; 
                        &nbsp;  <small class="text-muted"><i class="fa fa-bath fa-3x"><br><p style="font-size:small">Bath </p> </i>  </small> &nbsp;
                        &nbsp;  <small class="text-muted"><i class="fa fa-tachometer fa-3x"><br><p style="font-size:small">${boatdetails.cruiseSpeed}<br>Knots</p> </i></small> &nbsp;
                        &nbsp;  <small class="text-muted"><i class="fa fa-fire fa-3x"><br><p style="font-size:small">${boatdetails.fuel}<br>Fuel</p> </i></small>
                    </div>

                    <div class="textInfoBoat">
                        <h4>Boat information</h4>
                        <h5>Rent this incredible ${boatdetails.boatType} and enjoy the beaches around ${boatdetails.portsId.city}</h5>
                        <p> <b>Safe & Clean.</b> The owner of this boat has promised to comply with the safety and hygiene measures ordered by the local authorities, and to follow PortBNB's recommendations for the prevention of the coronavirus. <br>
                        </p>
                        <p> Sail with your family in the comfort of this great ${boatdetails.boatType} and enjoy a day full of relaxation and fun in one of the best natural scenery in the world.<br><br>

                            This versatile ${boatdetails.boatType} is ideal for adults and children. <br>
                            You can leave from ${boatdetails.portsId.portName} to sail in the bay and witness the spectacular beauty of marine life while snorkeling accompanied by an expert guide.<br><br>
                            Live the adventure of the day and enjoy the Beautiful Sea like never before! <br>
                        </p>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <h5 class="titleImage text-center">${boatdetails.portsId.portName} Port</h5>
                    <img alt="portimage" class="card-img"  style="height: 320px;" src="data:image/jpeg;base64,${portimage}"/>


                    <div class="bookingMessage">
                        <h1>Secure booking</h1>
                        <p><i class="fa fa-check"></i> Best Price Guaranteed!</p>

                        <p><i class="fa fa-check"></i> The Best Offer on the <br> Internet</p>
                    </div>

                    <div class="request">
                        <div class="text-center">
                            <p>${boatdetails.currentPrice} &euro; per Day <br>${boatdetails.currentPrice*7} &euro; per Week</p>
                            <a href="" data-toggle="modal" data-target="#requestOffer">
                                <button type="submit" class="requestbtn" style="width: 100%;"><i
                                        class="fa fa-search"></i>&nbsp;
                                    Request an Offer &nbsp;</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class=" container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center"> 
                    <div class="text-left">
                        <button type="button" class="collapsible">Terms & Conditions</button>
                        <div class="content">
                            <div class="row">
                                <div class="col-6">
                                    <ul>Mandatory extras</ul>
                                    <li>Docking fee when boarding : $12 per person per day</li><br>
                                    <ul>Other conditions</ul>
                                    <li>Second payment is due one month before charter</li>
                                    <li>If the charter is not possible because of severe weather conditions </li>
                                    <li>  you will be offered an alternative day. If no other date can be found,</li>
                                    <li> you will get a full refund.</li>
                                </div>
                                <div class="col-6">
                                    <ul>Timetable</ul>
                                    <li>For day charters check-in starts from 8:00 h.</li>
                                    <li>For day charters check-out is until 13:00 h.</li><br>   
                                    <ul>Base port</ul>
                                    <li>The Mooring at the base port is included</li>
                                    <li>The boat must return to the home port every night</li>
                                    <li>There is no overnight stay on board the boat</li><br>

                                </div>
                                All prices include tax. 
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div> 

        <div class="container">
            <div class="row" style="">
                <div class="specifics col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                    <h3 style="text-align:center;" >Specifications</h3>
                    <div class="boatInfo row">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-6">
                            <li>Manufacturer: ${boatdetails.manufacturer}</li>
                            <li>Model: ${boatdetails.model}</li>
                            <li>Year: ${boatdetails.constructionYear}</li>
                            <li>Boat Type: ${boatdetails.boatType}</li>
                            <li>Length (ft): ${boatdetails.boatLength}</li>
                            <li>Passenger Capacity: ${boatdetails.passengerCapacity}</li>
                            <li>No. of Beds/Cabins: ${boatdetails.beds}</li>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-6">
                            <li>Engine Power: ${boatdetails.enginePower}</li>
                            <li>Fuel Type: ${boatdetails.fuel}</li>
                            <li>Fuel Tank Capacity (gal): ${boatdetails.fuelTankCapacity}</li>
                            <li>Cruise Speed (knots): ${boatdetails.cruiseSpeed}</li>
                            <li>Max Speed (knots): ${boatdetails.maxSpeed}</li>
                            <li>City: ${boatdetails.portsId.city}</li>
                            <li>Port: ${boatdetails.portsId.portName}</li>
                        </div>
                    </div>

                    <div class="request">
                        <div class="text-center">
                            <p>${boatdetails.currentPrice} &euro; per Day <br>${boatdetails.currentPrice*7} &euro; Per week</p>
                            <a href="" data-toggle="modal" data-target="#requestOffer">
                                <button type="submit" class="requestbtn" style="width: 100%;"><i
                                        class="fa fa-search"></i>&nbsp;
                                    Request an Offer &nbsp;</button>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <div class="ownerContact">
                        <img src="data:image/jpeg;base64,${ownerimage}" class="mt-4 rounded-circle img-fluid w-75 mx-auto d-block" alt="ownerPic">
                    </div>
                    <div class="contact">
                        <li>Owner: ${boatdetails.accountsId.name} ${boatdetails.accountsId.surname}</li>
                        <li>Call me: ${boatdetails.accountsId.cellphone}</li>
                        <li>Email: <a href="mailto:${boatdetails.accountsId.email}">${boatdetails.accountsId.email}</a> </li>
                    </div>
                </div>
            </div>
        </div>

        <div class="rate container">
            <div class="ratingBar">
                <span class="heading">User Rating</span>
                <span id="starsavg">${reviewAvg[0]}</span>
                
                <p>${reviewAvg[0]} average based on ${reviewsLength} reviews.</p>
                <!--            <hr style="border:3px solid #f1f1f1">-->
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                    <div class="progressBar">
                        <h5>General Maintenance</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[1]}%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Cleanliness</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[2]}%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Comfort</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[3]}%"></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                    <div class="progressBar">
                        <h5>Harbour</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[4]}%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Hospitality</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[5]}%"></div>
                        </div>
                    </div>
                    <div class="progressBar">
                        <h5>Value for money</h5>
                        <div class="progress">
                            <div class="progress-bar" style="width:${reviewAvg[6]}%"></div>
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
        <div class="payment container">
            <h1>Payment methods</h1>
            <p>You can contact the owner <br>
                by email: <a href="mailto:${boatdetails.accountsId.email}">${boatdetails.accountsId.email}</a> <br>
                or <br> You can pay online with PayPal </p>
            <div id="paypal-button-container" ></div>
        </div>

        <div id="requestOffer" class="modal" tabindex="-1">
            <div class=" modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color:#3282b8">Booking</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    
                    <div class="bookingForm modal-body">
                        <form class="main-form needs-validation" novalidate="true" action="dobooking" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Check-in</label>
                                    <input type="date" name="startDate" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Check-out</label>
                                    <input name="endDate" type="date" class="form-control" id="endcheckoutdate" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="">Name</label>
                                    <input type="text" class="form-control" pattern="[A-Za-z]+" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="numPassenger">Passengers</label>
                                    <select name="passengers" id="destnumPassengers" class="form-control" required>
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="over8">over 8 people</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">Email Address</label>
                                <input type="email" class="form-control" id="inputAddress" required>
                            </div>
                            <div class="form-group">
                                <label for="">Phone number</label>
                                <input type="number" class="form-control" id="inputAddress2" required>
                            </div>
                            <label for="">Anything else you would like to tell me?</label>
                            <textarea id="w3review" name="w3review" rows="4" cols="55">
                            </textarea>
                            <div class="form-row">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                    <label class="form-check-label" for="gridCheck">
                                        Check me out
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Book me now</button>
                            </div>
                        </form>
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
        <script src="/js/validations.js"></script>
        <script src="https://www.paypal.com/sdk/js?client-id=AclT2R2sijDUVaf_NADn4bs6gxmUT186bz3fophkxQLEEhg60z6pioqE0Q8KPoW4in4hqZgKcyiBRWih&currency=EUR">
        // Required. Replace SB_CLIENT_ID with your sandbox client ID. </script>
        <script src="/js/paypal.js"></script>
        <script>
            $(document).ready(function () {
                let collaps = document.getElementsByClassName("collapsible");

            for (let trm = 0; trm < collaps.length; trm++) {
                collaps[trm].addEventListener("click", function () {
                    this.classList.toggle("actives");
                    var content = this.nextElementSibling;
                    if (content.style.display === "block") {
                        content.style.display = "none";
                    } else {
                        content.style.display = "block";
                    }
                });
            }
            let stars = parseInt(document.getElementById('starsavg').innerHTML);
            txt = '';
            for(let i=0; i< stars; i++){
                txt += '<span class="fa fa-star checked"></span>';
               
            }
            for(let j = stars; j < 5; j++) {
                txt += '<span class="fa fa-star star-gray"></span>';
            }
            document.getElementById('starsavg').innerHTML = txt;
        });
        </script>
    </body>
</html>
