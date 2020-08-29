<%-- 
    Document   : all-boats
    Created on : Aug 8, 2020, 1:51:51 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>Show all boats</title>

        <style>
            .pTitle {
                text-align: center;
                color: #0a9ab5;
            }

            .view {
                display: flex;
                justify-content: flex-end;
            }

            .card {

                flex-grow: 2;
                justify-content: flex-end;
                display: flex;
            }

            .card-img {
                height: 300px;
                width: 300px;
                background-color: white;
                overflow: hidden;
            }

            .checked {
                color: gold;
            }

            .card-title {
                color: #0f4c75
            }

            .description {
                margin-top: 10px;
                color: #3282b8;
            }

            .position {
                color: #3282b8;
            }

            label {
                width: 100%;
            }

            .toolTip {
                color: black;
                background-color: lightgreen;
                border: 1px solid;
                border-radius: 10px;
                width:245px;
            }

            .city {
                margin-top: 5px;
                color: #3282b8;
            }

            .cardFooter {
                background-color: #0a9ab5;
                flex-grow: 2;
                justify-content: flex-end;
                display: flex;
                justify-content: space-between;
            }

            .price {
                color: white;
                font-size: 25px;
                align-items: center;
                display: flex;
                margin-left: 15px;
            }

            .viewBtn {
                color: white;
                justify-content: flex-end;
                display: flex;
                align-items: center;
                margin-top: 10px;
                margin-right: 15px;
                border-radius: 5PX;
            }

            .borderForm {
                padding-top: 10px;
                border: 2px solid #0a9ab5;
                width: 300px;
                margin-top: 60px;
                padding: 15px;
                background-color: #0a9ab5;
                color: white;
                font-size: 15px;
            }

            .boat {
                margin-left: 0;
            }

            .searchForm {
                flex-grow: 2;
                display: flex;
                justify-content: center;
                background-color: whitesmoke;
            }

            .firstCol {
                flex-grow: 1;
                justify-content: flex-start;
                display: flex;
                align-items: center;
            }

            .secondCol {
                flex-grow: 6;
                justify-content: flex-start;
                display: flex;
                align-items: center;
            }
            .searchBtn{
                border-radius: 5PX;
                width: 100px;
            }
        </style>

    </head>

    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="searchForm row container-fluid">
            <div class="col-xs-2">
                <div class="borderForm">
                    <h1>Search</h1>
                    <form>
                        <div class="form-group">
                            <label for="destination">Where to sail ?</label>
                            <input type="text" name="destination" class="form-control" placeholder="Port, City" required="true" pattern="[A-Za-z]+"
                                   >
                            <div class="invalid-feedback">Choose destination <br> <small>alphabetic characters only</small>  </div>
                        </div>
                        <div class="form-group">
                            <label for="duration">Duration</label>
                            <select name="duration" id="destduration" required="true" class="form-control">
                                <option value="" selected disabled hidden>Any</option>
                                <option value="1day">1 day</option>
                                <option value="2days">2 days</option>
                                <option value="3days">3 days</option>
                                <option value="4days">4 days</option>
                                <option value="5days">5 days</option>
                                <option value="6days">6 days</option>
                                <option value="week">1 week</option>
                                <option value="8days">8 days</option>
                                <option value="9days">9 days</option>
                                <option value="10days">10 days</option>
                                <option value="11days">11 days</option>
                                <option value="12days">12 days</option>
                                <option value="13days">13 days</option>
                                <option value="2weeks">2 weeks</option>
                                <option value="over2weeks">Over 2 weeks</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="startDate">Start date</label>
                            <input type="date" class="form-control" id="deststartDate" required>
                        </div>
                        <div class="form-group">
                            <label for="typeBoat">Boat Type</label>
                            <select name="typeBoat" id="desttypeBoat" class="form-control">
                                <option value="" selected disabled hidden></option>
                                <option value="yacht">Yacht</option>
                                <option value="catamaran">Catamaran</option>
                                <option value="motorBoat">Motor boat</option>
                                <option value="ribBoat">Rib boat</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="length">Length</label>
                            <select name="length" id="destlength" class="form-control">
                                <option value="" selected disabled hidden></option>
                                <option value="any">Any</option>
                                <option value="0-6m">until 20ft/0-6m </option>
                                <option value="6-8m">20-26ft/6-8m</option>
                                <option value="8-10m">26-32ft/8-10m</option>
                                <option value="10-12m">32-40ft/10-12m</option>
                                <option value="12-15m">40-50ft/12-15m</option>
                                <option value="over15m">over 50ft/15m</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="numPassenger">Number of passengers</label>
                            <select name="numPassenger" id="destnumPassenger" class="form-control">
                                <option value="" selected disabled hidden></option>
                                <option value="1person">1 person</option>
                                <option value="2persons">2 persons</option>
                                <option value="3persons">3 persons</option>
                                <option value="4persons">4 persons</option>
                                <option value="6persons">6 persons</option>
                                <option value="8persons">8 persons</option>
                                <option value="10persons">10 persons</option>
                                <option value="12ormore">12 or more</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="priceRange">Price range per day</label>
                            <select name="priceRange" id="destpriceRange" class="form-control">
                                <option value="" selected disabled hidden></option>
                                <option value="1price">0 - 500 &euro;</option>
                                <option value="2price">500 &euro; - 1000 &euro;</option>
                                <option value="3price">1000 &euro; - 1500 &euro;</option>
                                <option value="4price">1500 &euro; - 2000 &euro;</option>
                                <option value="5price">2000 &euro; - 2500 &euro;</option>
                                <option value="6price">2500 &euro; - 3000 &euro;</option>
                                <option value="over3k">over 3000 &euro; </option> 
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sortBy">Sort by</label>
                            <select name="sortBy" id="destsortBy" class="form-control">
                                <option value="" selected disabled hidden></option>
                                <option value="popular">Popular</option>
                                <option value="HighToLow">Highest Price</option>
                                <option value="LowToHigh">Lowest Price</option>
                                <option value="BigToSmall">Biggest</option>
                                <option value="SmallToBig">Smallest</option>
                            </select>
                        </div>
                        <button type="Submit" class="searchBtn btn-primary"><i class="fa fa-search"></i>&nbsp;
                            Search &nbsp;</button>
                    </form>
                </div>
            </div>

            <div class="boat col-sm-8">
                <div class="boats">
                    <div class="pTitle">
                        <h1>Rental boats</h1>
                    </div>

                    <c:forEach items="${allboats}" var="b">
                        <div class="card container-fluid">

                            <div class="row">
                                <div class="firstCol col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                                    <img class="card-img" src="data:image/jpeg;base64,${boatImagesMap[b.id]}" alt="boatImagesMap"/>
                                </div>
                                <div class="secondCol col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8">
                                    <div class="card-body">
                                        <div>
                                            <h2 class="card-title">${b.manufacturer}  ${b.model}</h2>
                                        </div>
                                        <div class="star">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <br>
                                            <div class="toolTip" title="The owner offers free cancellation
                                                 up to 15 days before check-in.">&nbsp; Flexible cancellation or change! &nbsp; </div>
                                        </div>
                                        <div class="description">
                                            <p><small class="description">${b.boatType} boat model ${b.constructionYear} Length <i
                                                        class="fa fa-arrow-left"></i><i class="fa fa-arrow-right"></i> ${b.boatLength}
                                                    feet </small></p>
                                        </div>
                                        <div class="icons">
                                            <small class="text-muted"><i class="fa fa-users"></i> ${b.passengerCapacity} people</small> &nbsp;
                                            &nbsp;<small class="text-muted"><i class="fa fa-bed"></i> ${b.beds} beds</small> &nbsp;
                                            &nbsp;<small class="text-muted"><i class="fa fa-bath"></i> WC</small>&nbsp;
                                            &nbsp;<small class="text-muted"><i class="fa fa-tachometer"></i> ${b.cruiseSpeed} knots</small> &nbsp;
                                            &nbsp;<small class="text-muted"><i class="fa fa-fire"></i> ${b.fuel}</small>
                                        </div>
                                        <div class="city">
                                            <p><strong>City: </strong> ${b.portsId.city}</p>
                                        </div>
                                        <div>
                                            <i class="position fa fa-map-marker"><strong> Port: </strong>${b.portsId.portName}</i>
                                        </div>
                                        <div class="cardFooter row">
                                            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-8 col-xl-8">
                                                <p class="price">Price ${b.currentPrice} Euro/day</p>
                                            </div>
                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">

                                                <form action="showboatinfo" method="GET">
                                                    <input type="hidden" name="boatId" value="${b.id}">
                                                    <button type="Submit" class="viewBtn btn btn-primary"><i
                                                            class="fa fa-search"></i>&nbsp; VIEW BOAT &nbsp;</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        
        <span>Page: </span>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <c:choose>
                <c:when test="${i!=currentPage}">
                    <a href="/showallboats/page/<c:out value="${i}"/>"><c:out value="${i}"/></a>
                </c:when>
                <c:otherwise>
                    <c:out value="${i}"/>
                </c:otherwise>        
            </c:choose>   
        </c:forEach>  

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
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $(document).tooltip();
            });
        </script>
    </body>
</html>
