$(document).ready(function() {
    $('.search').hide();
    $('.more-info').hide();
    $('.drawer').hide();
    $('#map-active').fadeIn(10000);

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

    // $('#search').on('submit', function() {
    //  var $form = $(this);
    //  var route = $form.attr('action');
    //  var data = $form.serialize();
    //  var request = $.ajax({
    //      url: route,
    //      method: 'POST',
    //      data: data
    //  });

    //  request.done(function(response){
    //  });
    // });
});
