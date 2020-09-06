'use strict';

let boats = [];
fetch("/api/allboats")
        .then(response => response.json())
        .then(data => {
            data.map(boat => {
                boats.push(boat);
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

function boatCard(boat) {
    console.log(boat);
    let txt = '';
    
   
    txt +=  '<div class="card container-fluid">';
    txt +=      '<div class="row">';
    txt +=          '<div class="firstCol col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">';
    txt +=              '<img class="card-img" src="image/motorboat.jpg" alt="boatImagesMap"/>';
    txt +=          '</div>';
    txt +=          '<div class="secondCol col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8">';
    txt +=              '<div class="card-body">';
    txt +=          '<div>';
    txt +=              '<h2 class="card-title">' + boat.manufacturer + ' ' + boat.model + '</h2>';
    txt +=          '</div>';
    txt +=          '<div class="star">';
    txt +=              '<span class="fa fa-star checked"></span>';
    txt +=              '<span class="fa fa-star checked"></span>';
    txt +=              '<span class="fa fa-star checked"></span>';
    txt +=              '<span class="fa fa-star checked"></span>';
    txt +=              '<span class="fa fa-star checked"></span><br>';
    txt +=              '<div class="toolTip" title="The owner offers free cancellation \n\
                        up to 15 days before check-in.">&nbsp; Flexible cancellation or change! &nbsp; </div>';
    txt +=          '</div>';
    txt +=          '<div class="description">';
    txt +=              '<p><small class="description">' + boat.boatType + ' boat model ' + boat.constructionYear +
                        ' Length <i class="fa fa-arrow-left"></i><i class="fa fa-arrow-right"></i>' + boat.boatLength + ' feet </small></p>';
    txt +=          '</div>';
    txt +=          '<div class="icons">';
    txt +=              '<small class="text-muted"><i class="fa fa-users"></i>' + boat.passengerCapacity + ' people</small> &nbsp;';
    txt +=              '&nbsp;<small class="text-muted"><i class="fa fa-bed"></i>' + boat.beds + ' beds</small> &nbsp;';
    txt +=              '&nbsp;<small class="text-muted"><i class="fa fa-bath"></i> WC</small>&nbsp;';
    txt +=              '&nbsp;<small class="text-muted"><i class="fa fa-tachometer"></i>' + boat.cruiseSpeed + ' knots</small> &nbsp;';
    txt +=              '&nbsp;<small class="text-muted"><i class="fa fa-fire"></i>' + boat.fuel + '</small>';
    txt +=          '</div>';
    txt +=          '<div class="city">';
    txt +=              '<p><strong>City: </strong>' + boat.portsId.city + '</p>';
    txt +=          '</div>';
    txt +=          '<div>';
    txt +=              '<i class="position fa fa-map-marker"><strong> Port: </strong>' + boat.portsId.portName + '</i>';
    txt +=          '</div>';
    txt +=          '<div class="cardFooter row">';
    txt +=              '<div class="col-xs-4 col-sm-6 col-md-8 col-lg-8 col-xl-8">';
    txt +=                  '<p class="price">Price ' + boat.currentPrice + ' Euro/day</p>';
    txt +=              '</div>';
    txt +=              '<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">';
    txt +=                  '<form action="/showboatinfo" method="GET">';
    txt +=                      '<input type="hidden" name="boatId" value="' + boat.id + '">';
    txt +=                      '<button type="Submit" class="viewBtn btn-primary"><iclass="fa fa-search"></i>&nbsp; VIEW BOAT &nbsp;</button>';
    txt +=                  '</form>';
    txt +=         '</div>';
    txt +=        '</div>';
    txt +=      '</div>';
    txt +=     '</div>';
    txt +=    '</div>';
    txt +=  '</div>';
    txt += '</div>';
    return txt;
}

function reloadBoats() {
    let boatHTML = '';
    const boatType = document.getElementById('desttypeBoat').value.toLowerCase();
    const lengthRange = document.getElementById('destlength').value;
    const passengersRange = document.getElementById('destnumPassenger').value;
    const priceRange = document.getElementById('destpriceRange').value;
    
    boats.forEach(boat => {
        if(boatType !== "all"){
            if( boatType !== boat.boatType.toLowerCase() ) { return; }
        }
        
        if(lengthRange !== "any"){
            if(inBoatLength(lengthRange, boat.boatLength)) { return; }
        }
        
        if(passengersRange !== "any"){
            if( selectPassengers(passengersRange, boat.passengerCapacity ) ) { return; }
        }
        
        if(priceRange !== "any"){
            if( inPriceRange(priceRange, boat.currentPrice) ) { return; }
        }
        
        boatHTML += boatCard(boat);
    });
    document.getElementById('boat-list').innerHTML = boatHTML;
}

function inBoatLength(lengthRange, boatLength){
    switch(lengthRange){
        case "0-20":
            if( parseInt(boatLength) >= 20 ) return true;
            break;
        case "20-26":
            if( !(parseInt(boatLength) > 20 && parseInt(boatLength) <=26) ) return true;
            break;
        case "26-32":
            if( !(parseInt(boatLength) > 26 && parseInt(boatLength) <= 32) ) return true;
            break;
        case "32-40":
            if( !(parseInt(boatLength) > 32 && parseInt(boatLength) <= 40) ) return true;
            break;
        case "40-50":
            if( !(parseInt(boatLength) > 40 && parseInt(boatLength) <= 50) ) return true;
            break;
        case "over50":
            if( !(parseInt(boatLength) > 50) ) return true;
            break;
            }
        return false;
}

function selectPassengers(passengersRange, capacity ){
    switch(passengersRange){
        case "1-4":
            if( parseInt(capacity) >= 4 ) return true;
            break;
        case "5-8":
            if( !(parseInt(capacity) > 4 && parseInt(capacity) <= 8) ) return true;
            break;
        case "over8":
            if( !(parseInt(capacity) > 8) ) return true;
            break;
    }
    return false;
}

function inPriceRange(priceRange, price){
    switch(priceRange){
        case "1price":
            if( parseInt(price) >= 500 ) return true;
            break;
        case "2price":
            if( !(parseInt(price) > 500 && parseInt(price) <= 1000) ) return true;
            break;
        case "3price":
            if( !(parseInt(price) > 1000 && parseInt(price) <= 1500) ) return true;
            break;
        case "over1500":
            if( !(parseInt(price) > 1500) ) return true;
            break;
    }
    return false;
}


