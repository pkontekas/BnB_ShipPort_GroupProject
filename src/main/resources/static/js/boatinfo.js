/* global pricePerDay */

//function for terms and conditions collapsible
$(document).ready(function () {
    let collaps = document.getElementsByClassName('collapsible');
    for (let trm = 0; trm < collaps.length; trm++) {
        collaps[trm].addEventListener('click', function () {
            this.classList.toggle('actives');
            let content = this.nextElementSibling;
            if (content.style.display === 'block') {
                content.style.display = 'none';
            } else {
                content.style.display = 'block';
            }
        });
    }
    //code for Star Average
    let stars = parseInt(document.getElementById('starsavg').innerHTML);
    txt = '';
    for (let i = 0; i < stars; i++) {
        txt += '<span class="fa fa-star checked"></span>';
    }
    for (let j = stars; j < 5; j++) {
        txt += '<span class="fa fa-star star-gray"></span>';
    }
    document.getElementById('starsavg').innerHTML = txt;
    document.getElementById('starstop').innerHTML = txt;
});

//code for map coordinates
const longitude = parseFloat(document.getElementById('longitude').innerHTML);
const latitude = parseFloat(document.getElementById('latitude').innerHTML);
var ol;
let map = new ol.Map({
    target: 'showmap',
    layers: [
        new ol.layer.Tile({
            source: new ol.source.OSM()
        })
    ],
    view: new ol.View({
        center: ol.proj.fromLonLat([longitude, latitude]),
        zoom: 11
    })
});

//ajax call to rest method to check boat availability for checkin checkout for this boat
document.getElementById('bookButton').addEventListener('click', function (event) {

    let boatId = document.getElementById('thisBoat').value;
    let startDate = document.getElementById('bookStart').value;
    let endDate = document.getElementById('bookEnd').value;
    fetch("http://localhost:8080/api/availability/" + boatId + "/" + startDate + "/" + endDate)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                console.log(typeof data);
                if (data) {
                    document.getElementById('bookingErrorFeedback').innerHTML = "Ship is available!";
                    // do booking
                    //document.getElementById('bookForm').submit();
                } else {
                    event.preventDefault();
                    document.getElementById('bookingErrorFeedback').innerHTML = "Sorry, this ship is unavailable on those Dates.<br>Please try again.";
                }
            });
});

function getDifferenceInDays(date1, date2) {
    dt1 = date1;
    dt2 = date2;
    return Math.floor((Date.UTC(dt2.getFullYear(), dt2.getMonth(), dt2.getDate()) - Date.UTC(dt1.getFullYear(), dt1.getMonth(), dt1.getDate())) / (1000 * 60 * 60 * 24));
}

$(document).ready(function () {
    var today = new Date();
    var tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    document.getElementById('bookStart').valueAsDate = today;
    document.getElementById('bookStart').min = today.toISOString().slice(0, 10);
    document.getElementById('bookEnd').valueAsDate = tomorrow;
    document.getElementById('bookEnd').min = tomorrow.toISOString().slice(0, 10);
});

let sDate;
let eDate;
//on change event for checkin date
function onChangeCheckin() {
    sDate = document.getElementById('bookStart').value;
    eDate = document.getElementById('bookEnd').value;
    startDate = new Date(sDate);
    endDate = new Date(eDate);
    endDate = new Date(startDate.getTime() + 1000 * 60 * 60 * 24);
    document.getElementById('bookEnd').valueAsDate = endDate;
    document.getElementById('bookEnd').min = startDate.toISOString().slice(0, 10);
    document.getElementById('totalCost').value = (getDifferenceInDays(startDate, endDate)) * pricePerDay;
}
//on change event for checkout date
function onChangeCheckout() {
    sDate = document.getElementById('bookStart').valueAsDate;
    eDate = document.getElementById('bookEnd').valueAsDate;
    document.getElementById('totalCost').value = (getDifferenceInDays(sDate, eDate)) * pricePerDay;
}