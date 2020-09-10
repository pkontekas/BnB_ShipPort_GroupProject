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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>Show all boats</title>

        <style>
            .pTitle {
                text-align: center;
                color: #0a9ab5;
                margin: 20px;
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
                border-radius: 5px;
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
                margin-right: 80px;
                border-radius: 5px;
                width:130px;
            }
            .borderFormOne{
                width: 300px;
                padding: 15px;
                background-color:#0a9ab5;
                color: white;
                font-size: 15px;
                border-radius: 5px;
            }
            .borderFormTwo{
                width: 300px;
                padding: 15px;
                background-color: #0a9ab5;
                color: white;
                font-size: 15px;
                border-radius: 5px;
                position: sticky;
                top:0px;
                bottom:auto;
                margin-top: 10px;
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

    <body style="background-color:whitesmoke">

        <jsp:include page="navbar.jsp"/>

        <div class="pTitle">
            <h1>Rental boats</h1>
        </div>

        <div class="searchForm row container-fluid">
            <div class="col-xs-2">
                <div class="borderFormOne">
                    <h1>Search</h1>
                    <form>
                        <div class="form-group">
                            <label for="destination">Where to Sail ?</label>
                            <input type="text" id="search-text" name="destination" class="form-control" placeholder="Port, City" required="true">
                            <div class="invalid-feedback">Choose Destination <br></div>
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
                            <label for="startDate">Start Date</label>
                            <input type="date" class="form-control" id="deststartDate" required>
                        </div>


                        <button type="Submit" class="searchBtn btn-primary" onclick="reloadBoats()"><i class="fa fa-search"></i>&nbsp;
                            Search &nbsp;</button>
                    </form>
                </div>
                <div class="borderFormTwo">
                    <form>
                        <div class="form-group">
                            <label for="typeBoat">Boat Type</label>
                            <select name="typeBoat" id="desttypeBoat" class="form-control" onchange="reloadBoats()">
                                <option value="all">All</option>
                                <option value="yacht">Yacht</option>
                                <option value="catamaran">Catamaran</option>
                                <option value="motorboat">Motorboat</option>
                                <option value="rib">Rib Boat</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="length">Length</label>
                            <select name="length" id="destlength" class="form-control" onchange="reloadBoats()">
                                <option value="any">Any</option>
                                <option value="0-20">Until 20ft/0-6m </option>
                                <option value="21-30">20-30ft/6-9m</option>
                                <option value="31-50">30-50ft/10-15m</option>
                                <option value="over50">Over 50ft/15m</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="numPassenger">Number of Passengers</label>
                            <select name="numPassenger" id="destnumPassenger" class="form-control" onchange="reloadBoats()">
                                <option value="any" selected>Any</option>
                                <option value="1-4">1-4 people</option>
                                <option value="5-8">5-8 people</option>
                                <option value="over8">over 8 people</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="priceRange">Price Range per Day</label>
                            <select name="priceRange" id="destpriceRange" class="form-control" onchange="reloadBoats()">
                                <option value="any" selected>Any</option>
                                <option value="1price">0 - 300 &euro;</option>
                                <option value="2price">300 &euro; - 750 &euro;</option>
                                <option value="3price">750 &euro; - 1200 &euro;</option>
                                <option value="over1200">over 1200 &euro; </option> 
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sort-by">Sort By</label>
                            <select name="sort-by" id="sort-options" class="form-control" onchange="reloadBoats()">
                                <option value="" selected disabled hidden></option>
                                <option value="popular">Most Popular</option>
                                <option value="price-asc">Highest Price</option>
                                <option value="price-desc">Lowest Price</option>
                                <option value="size-asc">Biggest Boat</option>
                                <option value="size-desc">Smallest Boat</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            <div class="boat col-sm-8">
                <div class="boats">

                    <div class="row gray-div" id="boat-list">
                        <!-- To be populated by JS initially and after applying filters -->
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
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
                                function loadInitialFilter() {
                                    let filterSelection = "";
                                    filterSelection = '<%= session.getAttribute("filterselected")%>';
                                    if (filterSelection === "catamaran" || filterSelection === "rib" ||
                                            filterSelection === "yacht" || filterSelection === "motorboat")
                                        $('#desttypeBoat').val(filterSelection);
                                    else
                                    {
                                        switch (filterSelection) {
                                            case "piraeus":
                                                $("#search-text").attr("value", "Piraeus Harbour");
                                                return true;
                                                break;
                                            case "paros":
                                                $('#search-text').val("Parikia Harbour Paros");
                                                return true;
                                                break;
                                            case "mikonos":
                                                $('#search-text').val("Mykonos");
                                                return true;
                                                break;
                                            case "irakleio":
                                                $('#search-text').val("Heraklion Port Authority");
                                                return true;
                                                break;
                                            default:
                                                return;
                                        }
                                    }
                                }
        </script>
        <script src="/js/allboats.js"></script>
    </body>
</html>
