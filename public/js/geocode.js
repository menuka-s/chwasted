$(document).ready(function() {
  base_url = 'http://maps.google.com/maps/api/geocode/json?sensor=false&address='

  for (var i=1; i< 20; i++) {
    url = "/address/" + parseInt(i);
    ajaxReq = $.ajax({url: url, method: "get"});
    ajaxReq.done(function(data) {
      id = data.split(':')[0];
      address = data.split(':')[1];
      google_url = base_url + address;
      googleReq = $.ajax({url: google_url, method: "get"})
      googleReq.done(function(data) {
        var lat = data["results"][0]["geometry"]["location"]["lat"];
        var lng = data["results"][0]["geometry"]["location"]["lng"];
        var place_id = data["results"][0]["place_id"];
        var postString = "lat=" + lat + "&lng=" + lng + "&google_place_id=" + place_id;
        recordData = $.ajax({url: url, method: "post", data: postString});
        recordData.error(function(){
          console.log("ERROR " + id);
        });
        recordData.done(function() {
          console.log("Done " + id)
        });
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
