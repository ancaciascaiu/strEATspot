$(document).ready(function(){
  // AJAX for vendor location button
  $('.switch').on('click', function(event){
    event.preventDefault();
      console.log($(this).find('input')[0]);
    // checks to see if button is switched on or off
    if($(this).find('input')[0].hasAttribute('checked') === false){

      getVendorLocation().then(function(dataNew){
        console.log(dataNew);
        var request = $.ajax({
          url: '/locations',
          method: 'POST',
          data: dataNew
        });
      });

    } else {
      var request = $.ajax({
        url: '/locations',
        method: 'DELETE'
      });
    };
  });
});
