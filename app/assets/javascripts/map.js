// Get radius
var rad = function(x) {
  return x * Math.PI / 180;
};

// Store all locations
var markerArray = [
  {lat: 41.878674, lng: -87.640333},
  {lat: 41.878274, lng: -87.640330},
  {lat: 41.878644, lng: -87.640303},
  {lat: 41.873674, lng: -87.640033},
  {lat: 41.878670, lng: -87.620333},
  {lat: 41.858674, lng: -87.640000},
  {lat: 41.878994, lng: -87.649533},
  {lat: 41.778674, lng: -87.540333},
  {lat: 41.878600, lng: -87.644003}
];

// Gets distance between two coordinates
var getDistance = function(p1, p2) {
  var R = 6378137; // Earth’s mean radius in meter
  var dLat = rad(p2.lat() - p1.lat());
  var dLong = rad(p2.lng() - p1.lng());
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
    Math.sin(dLong / 2) * Math.sin(dLong / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var distance = R * c;
  return distance; // returns the distance in meter
};

// Check for marker being inside radius
function radiusCheck(marker1, marker2, radius) {
  if(getDistance(marker1, marker2) <= radius){
    return true
  } else {
    return false
  };
};

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
    'Error: The Geolocation service failed.' :
    'Error: Your browser doesn\'t support geolocation.');
};
var map;
// Initialize map
function initMap(markers) {

// Creates a new map instance
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 41.878670, lng: -87.640000},
    zoom: 13 // 1-21 with 21 being fully zoomed in
  });

  // Creates the circle
  var circle = new google.maps.Circle({
    center: map.center,
    map: map,
    radius: 1500, // ~1 MILE IN METERS.
    fillColor: '#FF6600',
    fillOpacity: 0.3,
    strokeColor: "#FFF",
    strokeWeight: 2
  });

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var userCoords = new google.maps.LatLng(pos.lat, pos.lng);
      console.log(pos);
      circle.center = userCoords;
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });

  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
  var customerPosition = new google.maps.LatLng(circle.center.lat(), circle.center.lng());
  console.log(circle.center.lat());
  createMarkers(markerArray, customerPosition, circle);
};

var createMarkers = function(markers, userPosition, circle){
  var image = './dooftruck.png';
    console.log(userPosition);
    console.log(circle.radius);

// Iterates through all stored map markers
  for(var i = 0; i < markers.length; i++){
    var newMarkerCoordinates = new google.maps.LatLng(markers[i].lat, markers[i].lng);

    if(radiusCheck(userPosition, newMarkerCoordinates, circle.radius) == true){

      new google.maps.Marker({
        position: markers[i],
        map: map,
        icon: image,
        animation: google.maps.Animation.DROP
      });

    } else { };
  }
};
