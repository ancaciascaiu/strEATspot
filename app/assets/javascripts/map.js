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

// Initialize map
function initMap() {
  var image = './dooftruck.png';

// Creates a new map instance
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 41.878670, lng: -87.640000},
    zoom: 13 // 1-21 with 21 being fully zoomed in
  });

// Request to view user location
  var infoWindow = new google.maps.InfoWindow({map: map});
  var userCoords = {};
  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      userCoords = pos;
      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }

// Creates the circle
  var circle = new google.maps.Circle({
    center: userCoords,
    map: map,
    radius: 1000,          // IN METERS.
    fillColor: '#FF6600',
    fillOpacity: 0.3,
    strokeColor: "#FFF",
    strokeWeight: 0.5         // DON'T SHOW CIRCLE BORDER.
  });
// Iterates through all stored map markers
  var customerPosition = new google.maps.LatLng(map.center.lat(), map.center.lng());
  console.log(customerPosition);

  for(var i = 0; i < markerArray.length; i++){
    var newMarkerCoordinates = new google.maps.LatLng(markerArray[i].lat, markerArray[i].lng);

    if(radiusCheck(customerPosition, newMarkerCoordinates, circle.radius) == true){

      new google.maps.Marker({
        position: markerArray[i],
        map: map,
        icon: image,
        animation: google.maps.Animation.DROP
      });

    } else { };
  };
};
