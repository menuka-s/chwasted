$(document).ready(function() {
  base_url = 'http://maps.google.com/maps/api/geocode/json?sensor=false&address='

  for (var i=1; i< 2; i++) {
    var url = "/address/" + parseInt(i);
    var ajaxReq = $.ajax({url: url, method: "get"});
    ajaxReq.done(function(data) {
      var id = data.split(':')[0];
      var address = data.split(':')[1];
      var google_url = base_url + address;
      var googleReq = $.ajax({url: google_url, method: "get"})
      googleReq.done(function(data) {
        var lat = data["results"][0]["geometry"]["location"]["lat"];
        var lng = data["results"][0]["geometry"]["location"]["lng"];
        var place_id = data["results"][0]["place_id"];
        var postString = "lat=" + lat + "&lng=" + lng + "&google_place_id=" + place_id + "&address=" + address;

        var recordData = $.ajax({url: "/address", method: "post", data: postString});
        recordData.error(function(){
          console.log("ERROR " + id);
        });
        recordData.done(function() {
          console.log("Done " + id)
        });
      });


      googleReq.error(function() {
        console.log("damn..." + id + " failed. sucks.")
      });
      googleReq.fail(function() {
        console.log("damn..." + id + " failed. sucks.")
      });
    });
  };
});



//   ajaxReq = $.ajax({url: url, method: "get"})
//   ajaxReq.done(function(data) {
//     console.log(data)
//     //returnData = JSON.parse(data);
//     //console.log(returnData);
//     debugger
//     $('body').append(JSON.stringify(data));
//   });

// })

//
// data["results"][0]["geometry"]["location"]["lat"]
// data["results"][0]["geometry"]["location"]["lng"]
