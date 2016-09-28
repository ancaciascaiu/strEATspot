// Get radius
var rad = function(x) {
  return x * Math.PI / 180;
};

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

// Store all locations
var markerArray = [
  {title:  "Avnerosmith's Banana Blitz", coords: {lat: 41.878674, lng: -87.640333}},
  {title:  "The Baker Brats", coords: {lat: 41.878274, lng: -87.640330}},
  {title:  "3 Duke's Greene's", coords: {lat: 41.878644, lng: -87.640303}},
  {title:  "Pete's Pristine Perfect Pineapple Pizza", coords: {lat: 41.873674, lng: -87.640033}},
  {title:  "Ellie's Deli", coords: {lat: 41.878670, lng: -87.620333}},
  {title:  "Alycit Confec-ssions", coords: {lat: 41.858674, lng: -87.640000}},
  {title: "My Taco Truck", coords: {lat: 41.878994, lng: -87.649533}},
  {title: "West's East Side, Boat Side Smoothies", coords: {lat: 41.778674, lng: -87.540333}},
  {title: "Tory's Tortillas", coords: {lat: 41.878600, lng: -87.644003}}
];

var map;

var radius = 1500;

// Initialize map
function initMap() {

// Creates a new map instance
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 41.878670, lng: -87.640000},
    zoom: 13 // 1-21 with 21 being fully zoomed in
  });

  // Creates the circle
  var circle = new google.maps.Circle({
    center: map.center,
    map: map,
    radius: radius, // ~1 MILE IN METERS.
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
      circle.setCenter = userCoords;
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
  // Sets radius and filters by customer location
  var customerPosition = new google.maps.LatLng(circle.center.lat(), circle.center.lng());
  createMarkers(markerArray, customerPosition, circle);
};

var createMarkers = function(markers, userPosition, circle){
// Iterates through all stored map markers
  for(var i = 0; i < markers.length; i++){
    var newMarkerCoordinates = new google.maps.LatLng(markers[i].coords.lat, markers[i].coords.lng);

    if(radiusCheck(userPosition, newMarkerCoordinates, circle.radius) == true){
      createMarker(markers[i].title, markers[i]);
    } else { };
  }
};

// Gets the location of a vendor on button click
var getVendorLocation = function(){
  var deferred = new $.Deferred();
  // Triggers if gps gives permission
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      deferred.resolve(pos);
      // Throws error if permission is denied
    }), function() {
      handleLocationError(true, infoWindow, map.getCenter());
    };
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
    return deferred.promise();
};

var createMarker = function(markerTitle, marker){
  var image = './dooftruck.png';
  new google.maps.Marker({
    position: marker.coords,
    map: map,
    icon: image,
    title: marker.title,
    animation: google.maps.Animation.DROP
  })
};










