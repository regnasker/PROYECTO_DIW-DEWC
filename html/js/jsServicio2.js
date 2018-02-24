"use strict";





    var crd;
    // var miposLat;
    // var miposLng;

    function success(pos) {
      // var crd = pos.coords;

      var gLatLng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
      console.log(gLatLng);

      var kLatLng = new google.maps.LatLng(39.5117123,-0.3607491);
      console.log(kLatLng);

      var dist = google.maps.geometry.spherical.computeDistanceBetween(gLatLng, kLatLng);
      // console.log(dist);
      // console.log(google.maps.geometry.spherical.computeDistanceBetween(gLatLng, kLatLng));
      console.log((Math.round(dist)/1000) + "km");

      // var miposLat = crd.latitude;
      // var miposLng = crd.longitude;
      // console.log('Your current position is:');
      // console.log('Latitude : ' + crd.latitude);
      // console.log('Longitude: ' + crd.longitude);
      // console.log('More or less ' + crd.accuracy + ' meters.');
    };
    // console.log(crd);
    // console.log(miposLat);
    // console.log(miposLng);

    window.addEventListener('DOMContentLoaded', function() {
        navigator.geolocation.getCurrentPosition(success); // Nos geolocalizamos
    });
