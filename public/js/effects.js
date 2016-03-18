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

    //  {
    //  event.preventDefault();
    //  var search = '<li><input id="nav-search" autocomplete="off" type="text" name="search_term" placeholder="LOCATION" value=""></li>';
    //  $(this).fadeOut(2000)
    //  $('#map').fadeOut(3000);
    //  $('#map-active').show(3000);
    //  $('.right').prepend(search).hide().fadeIn(3000);
    // });
});
