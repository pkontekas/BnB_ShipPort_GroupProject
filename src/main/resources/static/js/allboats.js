/* global fetch */

'use strict';

var boats = [];
var priceList = [];
var cityNames = [];
var portNames = [];

fetch("/api/allboats")
        .then(response => response.json())
        .then(data => {
            data.map(boat => {
                boats.push(boat);
            });

            // Find prices
            boats.map(boat => {
                priceList.push(boat.currentPrice);
            });

            // Create city names array to be used with auto completion
            boats.map(boat => {
                if (cityNames.includes(boat.city)) {
                    return;
                }
                cityNames.push(boat.city);
            });

            // Create city names array to be used with auto completion
            boats.map(boat => {
                if (portNames.includes(boat.portName)) {
                    return;
                }
                portNames.push(boat.portName);
            });

            let boatHTML = '';
            boats.map(boat => {
                boatHTML += boatCard(boat);
            });
            document.getElementById('boat-list').innerHTML = boatHTML;
        })
        .catch(error => {
            console.error('Data file not accessible: ', error);
        });

//TO DO does not work yet will need 2 sources cityNames and portNames
$("#search-text").autocomplete({
    source: cityNames //portNames
});

function boatCard(boat) {
    console.log(boat);
    let txt = '';

    txt += '<div class="card container-fluid">';
    txt += '<div class="row">';
    txt += '<div class="firstCol col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">';
    txt += '<img class="card-img" src="image/motorboat.jpg" alt="boatImagesMap"/>';
    txt += '</div>';
    txt += '<div class="secondCol col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">';
    txt += '<div class="card-body">';
    txt += '<div>';
    txt += '<h2 class="card-title">' + boat.manufacturer + ' ' + boat.model + '</h2>';
    txt += '</div>';
    txt += '<div class="star">';
    txt += '<span class="fa fa-star checked"></span>';
    txt += '<span class="fa fa-star checked"></span>';
    txt += '<span class="fa fa-star checked"></span>';
    txt += '<span class="fa fa-star checked"></span>';
    txt += '<span class="fa fa-star checked"></span><br>';
    txt += '<div class="toolTip" title="The owner offers free cancellation \n\
                        up to 15 days before check-in.">&nbsp; Flexible cancellation or change! &nbsp; </div>';
    txt += '</div>';
    txt += '<div class="description">';
    txt += '<p><small class="description">' + boat.boatType + ' boat model ' + boat.constructionYear +
            ' Length <i class="fa fa-arrow-left"></i><i class="fa fa-arrow-right"></i>' + boat.boatLength + ' feet </small></p>';
    txt += '</div>';
    txt += '<div class="icons">';
    txt += '<small class="text-muted"><i class="fa fa-users"></i>' + boat.passengerCapacity + ' people</small> &nbsp;';
    txt += '&nbsp;<small class="text-muted"><i class="fa fa-bed"></i>' + boat.beds + ' beds</small> &nbsp;';
    txt += '&nbsp;<small class="text-muted"><i class="fa fa-bath"></i> WC</small>&nbsp;';
    txt += '&nbsp;<small class="text-muted"><i class="fa fa-tachometer"></i>' + boat.cruiseSpeed + ' knots</small> &nbsp;';
    txt += '&nbsp;<small class="text-muted"><i class="fa fa-fire"></i>' + boat.fuel + '</small>';
    txt += '</div>';
    txt += '<div class="city">';
    txt += '<p><strong>City: </strong>' + boat.portsId.city + '</p>';
    txt += '</div>';
    txt += '<div>';
    txt += '<i class="position fa fa-map-marker"><strong> Port: </strong>' + boat.portsId.portName + '</i>';
    txt += '</div>';
    txt += '<div class="cardFooter row">';
    txt += '<div class="col-xs-sm-md-lg-xl">';
    txt += '<p class="price">Price ' + boat.currentPrice + ' Euro/day</p>';
    txt += '</div>';
    txt += '<div class="col-xs-sm-md-lg-xl">';
    txt += '<form action="/showboatinfo" method="GET">';
    txt += '<input type="hidden" name="boatId" value="' + boat.id + '">';
    txt += '<button type="Submit" class="viewBtn btn-primary"><iclass="fa fa-search"></i>&nbsp; VIEW BOAT &nbsp;</button>';
    txt += '</form>';
    txt += '</div>';
    txt += '</div>';
    txt += '</div>';
    txt += '</div>';
    txt += '</div>';
    txt += '</div>';
    txt += '</div>';
    return txt;
}

function reloadBoats() {
    let boatHTML = '';
    const boatType = document.getElementById('desttypeBoat').value.toLowerCase();
    const lengthRange = document.getElementById('destlength').value;
    const passengersRange = document.getElementById('destnumPassenger').value;
    const priceRange = document.getElementById('destpriceRange').value;

    var sortBy = document.getElementById('sort-options').value;

    if (sortBy === "price-asc") {
        boats.sort(comparePriceAsc);
        console.log(boats);
    } else if (sortBy === "price-desc") {
        boats.sort(comparePriceDesc);
        console.log(boats);
    } else if (sortBy === "size-desc") {
        boats.sort(compareSizeDesc);
        console.log(boats);
    } else if (sortBy === "size-asc") {
        boats.sort(compareSizeAsc);
        console.log(boats);
    }

    boats.forEach(boat => {
        if (boatType !== "all") {
            if (boatType !== boat.boatType.toLowerCase()) {
                return;
            }
        }
        if (lengthRange !== "any") {
            if (inBoatLength(lengthRange, boat.boatLength)) {
                return;
            }
        }

        if (passengersRange !== "any") {
            if (selectPassengers(passengersRange, boat.passengerCapacity)) {
                return;
            }
        }

        if (priceRange !== "any") {
            if (inPriceRange(priceRange, boat.currentPrice)) {
                return;
            }
        }

        boatHTML += boatCard(boat);
    });
    document.getElementById('boat-list').innerHTML = boatHTML;
}

function inBoatLength(lengthRange, boatLength) {
    switch (lengthRange) {
        case "0-20":
            if (parseInt(boatLength) >= 20)
                return true;
            break;
        case "21-30":
            if (!(parseInt(boatLength) > 20 && parseInt(boatLength) <= 30))
                return true;
            break;
        case "31-50":
            if (!(parseInt(boatLength) > 30 && parseInt(boatLength) <= 50))
                return true;
            break;
        case "over50":
            if (!(parseInt(boatLength) > 50))
                return true;
            break;
    }
    return false;
}

function selectPassengers(passengersRange, capacity) {
    switch (passengersRange) {
        case "1-4":
            if (parseInt(capacity) >= 4)
                return true;
            break;
        case "5-8":
            if (!(parseInt(capacity) > 4 && parseInt(capacity) <= 8))
                return true;
            break;
        case "over8":
            if (!(parseInt(capacity) > 8))
                return true;
            break;
    }
    return false;
}

function inPriceRange(priceRange, price) {
    switch (priceRange) {
        case "1price":
            if (parseInt(price) >= 300)
                return true;
            break;
        case "2price":
            if (!(parseInt(price) > 300 && parseInt(price) <= 750))
                return true;
            break;
        case "3price":
            if (!(parseInt(price) > 750 && parseInt(price) <= 1200))
                return true;
            break;
        case "over1200":
            if (!(parseInt(price) > 1200))
                return true;
            break;
    }
    return false;
}

function compareSizeDesc(a, b) {
    if (a.boatLength > b.boatLength) {
        return 1;
    }
    if (b.boatLength > a.boatLength) {
        return -1;
    }

    return 0;
}

function compareSizeAsc(a, b) {
    if (a.boatLength < b.boatLength) {
        return 1;
    }
    if (b.boatLength < a.boatLength) {
        return -1;
    }

    return 0;
}

function comparePriceDesc(a, b) {
    if (a.currentPrice > b.currentPrice) {
        return 1;
    }
    if (b.currentPrice > a.currentPrice) {
        return -1;
    }

    return 0;
}

function comparePriceAsc(a, b) {
    if (a.currentPrice < b.currentPrice) {
        return 1;
    }
    if (b.currentPrice < a.currentPrice) {
        return -1;
    }

    return 0;
}