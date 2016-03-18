

var geocoder;
var map;
var bounds = new google.maps.LatLngBounds();
var locations = [];
var locations_full = [];
// google.maps.event.addDomListener(window, "load", initialize);

var ajaxReq = $.ajax({url: "/places2", method: "get"});
    ajaxReq.done(function(data) {
     locations = JSON.parse(data);
     initialize();
});





function initialize() {
    map = new google.maps.Map(
    document.getElementById("map_canvas"), {
        center: new google.maps.LatLng(41.8896985,-87.6396759),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    geocoder = new google.maps.Geocoder();


    numPlaces = locations.length;



    for (i = 0; i < locations.length; i++) {
        geocodeAddress(locations, i);
    }
}

function geocodeAddress(locations, i) {
    var title = locations[i][0];
    var address = locations[i][1];
    var url = locations[i][2];



    geocoder.geocode({
        'address': locations[i][1]
    },

    function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var marker = new google.maps.Marker({
                icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
                map: map,
                position: results[0].geometry.location,
                title: title,
                animation: google.maps.Animation.DROP,
                address: address,
                url: url
            })
            infoWindow(marker, map, title, address, url);
            bounds.extend(marker.getPosition());
            map.fitBounds(bounds);
        } else {
            alert("geocode of " + address + " failed:" + status);
        }
    });
}

function infoWindow(marker, map, title, address, url) {
    google.maps.event.addListener(marker, 'click', function () {



        var html = "<div><h3>" + title + "</h3><p><b>" + address + "<br>" + url + "</b></p></div>";
        iw = new google.maps.InfoWindow({
            content: html,
            maxWidth: 350
        });
        iw.open(map, marker);
    });
}

function createMarker(results) {
    var marker = new google.maps.Marker({
        icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
        map: map,
        position: results[0].geometry.location,
        title: title,
        animation: google.maps.Animation.DROP,
        address: address,
        url: url
    })
    bounds.extend(marker.getPosition());
    map.fitBounds(bounds);
    infoWindow(marker, map, title, address, url);
    return marker;
}
