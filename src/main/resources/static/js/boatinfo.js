/* global ol */

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
    for (let i = 0; i < stars; i++) {
        txt += '<span class="fa fa-star checked"></span>';
    }
    for (let j = stars; j < 5; j++) {
        txt += '<span class="fa fa-star star-gray"></span>';
    }
    document.getElementById('starsavg').innerHTML = txt;
    document.getElementById('starstop').innerHTML = txt;
});

const longitude = parseFloat(document.getElementById('longitude').innerHTML);
const latitude = parseFloat(document.getElementById('latitude').innerHTML);
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

document.getElementById("bookButton").addEventListener("click", function (event) {
    event.preventDefault();

    let boatId = 14;
    let startDate = document.getElementById("bookStart").value;
    let endDate = document.getElementById("bookEnd").value;
    fetch("http://localhost:8080/api/availability/" + boatId + "/" + startDate + "/" + endDate)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                console.log(typeof data);
                if(data) {
                    document.getElementById("bookingErrorMessage").innerHTML = "";
                    // do booking
                }
                else {
                   document.getElementById("bookingErrorMessage").innerHTML = "Booking Unavailable on those Dates!";
                }
            });
});
