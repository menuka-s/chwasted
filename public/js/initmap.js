
  var map, map2;
  function initMap() {
    // Create a map object and specify the DOM element for display.
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 41.8896848, lng: -87.6399389},
        scrollwheel: false,
        zoom: 12
      });

      var map2 = new google.maps.Map(document.getElementById('map-active'), {
        center: {lat: 41.8896848, lng: -87.6399389},
        scrollwheel: true,
        zoom: 14
      });
    }

