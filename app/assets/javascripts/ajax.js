$(document).ready(function(){
  // AJAX for vendor location button
  $('#location-toggle').on('click', '.switch', function(event){
    event.preventDefault();
    var $button = $(this)
    var $input = $(this).find('input')
    // checks to see if button is switched on or off
    if($input[0].hasAttribute('checked') === false){
      // gets location and send coords to controller for vendor update
      getVendorLocation().then(function(dataNew){
        var request = $.ajax({
          url: 'locations',
          method: 'POST',
          data: dataNew
        });
        // toggles button display with response
        request.done(function(response){
          $button.replaceWith(response);
        })
      });

    } else {
      var request = $.ajax({
        url: '/locations',
        method: 'DELETE'
      });
      // toggles button display with response
      request.done(function(response){
        $button.replaceWith(response);
      })
    };
  });
  // jQuery for updating circle radius
  $("#radius-form").on('submit', function(event){
    event.preventDefault();
    var radiusString = $(this).children('#slider').val();
    radius = parseInt(radiusString);
    initMap();
  });
  // AJAX for grabbing favorites
  $('#favorites-form').on('submit', function(event){
    event.preventDefault();
      $form = $(this);

    var request = $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method')
    });

    request.done(function(response){
      markerArray = response;
      initMap();
    })
  });
  // AJAX for grabbing by category
  $('#category-form').on('submit', function(event){
    event.preventDefault();
    $form = $(this)

    var request = $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    });

    request.done(function(response){
      markerArray = response;
      initMap();
    });
  })
});

