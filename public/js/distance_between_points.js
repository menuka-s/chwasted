var rad = function(x) {
  return x * Math.PI / 180;
};

var getDistance = function(p1, p2) {
  var R = 6378137; // Earth’s mean radius in meter
  var dLat = rad(p2.lat() - p1.lat());
  var dLong = rad(p2.lng() - p1.lng());
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
    Math.sin(dLong / 2) * Math.sin(dLong / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  return d; // returns the distance in meter
};


//in action:

// var rad = function(x) {
//   return x * Math.PI / 180;
// };

// var getDistance = function(p1, p2) {
//   var R = 6378137; // Earth’s mean radius in meter
//   var dLat = rad(p2.lat() - p1.lat());
//   var dLong = rad(p2.lng() - p1.lng());
//   var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
//     Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
//     Math.sin(dLong / 2) * Math.sin(dLong / 2);
//   var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//   var d = R * c;
//   return d; // returns the distance in meter
// };
// undefined
// p1 = {lat: function() { return 41.8896985 },
// VM235:3 Uncaught SyntaxError: Unexpected end of input(…)InjectedScript._evaluateOn @ VM124:878InjectedScript._evaluateAndWrap @ VM124:811InjectedScript.evaluate @ VM124:667
// p1 = {lat: function() { return 41.8896985 }, lng: function() { return -87.6396759} }
// Object {}
// p2 = {lat: function() { return 41.8911536 }, lng: function() { return -87.6359156} }
// Object {}
// d = getDistance(p1,p2)
// 351.19739056834027
