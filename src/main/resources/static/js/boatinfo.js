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
