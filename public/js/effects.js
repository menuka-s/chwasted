$(document).ready(function() {
    $('nav').hide();
    $('nav').slideToggle(1000);
    $('.logo').hide();
    $('.logo').fadeIn(3000);
    $('.search').hide();
    $('.more-info').hide();
    $('.drawer').hide();
    $('#nav-search').hide();
    $('#nav-search').fadeIn(3000);

    $('.money').on('submit', function() {
        event.preventDefault();
        $('.money').fadeOut(1000);
        $('.search').fadeIn(3000);
    });

    $('.money').on('click', function() {
        var money = '$'
        var val = $('#textarea').val()
        $('#money-input').select().val(money)
    });

    $("#toggle").click(function(){
        $(".drawer").slideToggle(1000);
    });

    $('.slot').on('click', function() {
        $(this).next().slideToggle(1000)
    });

$('#search').one("submit", onSubmit)

function onSubmit(event) {
    event.preventDefault()
        address = $('#search-input').val().replace(/ /g,"%20");
        base_url = 'http://maps.google.com/maps/api/geocode/json?sensor=false&address=';
        var google_url = base_url + address;

    var googleReq = $.ajax({url: google_url, method: "get"})
        googleReq.done(coordsDelivered);
};

function coordsDelivered(data) {

      var lat = data["results"][0]["geometry"]["location"]["lat"];
      var lng = data["results"][0]["geometry"]["location"]["lng"];
      $('#coords').val(lat + "," + lng);
      console.log(lat + "," + lng);
      $('#search').trigger("submit");

    }

    //  {
    //  event.preventDefault();
    //  var search = '<li><input id="nav-search" autocomplete="off" type="text" name="search_term" placeholder="LOCATION" value=""></li>';
    //  $(this).fadeOut(2000)
    //  $('#map').fadeOut(3000);
    //  $('#map-active').show(3000);
    //  $('.right').prepend(search).hide().fadeIn(3000);
    // });
});
