$.getScript("http://www.cfl.lu/_layouts/15/CFL/gmaps/js/map.data-segments.js", function(){
console.log('<?xml version="1.0"?>')
console.log('<gpx version="1.1" creator="Xcode">')


var mapVoyageursResources = {
    l10Name: "Luxembourg - Troisvierges - Gouvy",
    l30Name: "Luxembourg - Wasserbillig - Trier",
    l50Name: "Luxembourg - Kleinbettingen - Arlon",
    l60Name: "Luxembourg - Esch/Alzette - Rodange - Athus",
    l70Name: "Luxembourg - Rodange - Athus - Longwy",
    l80Name: "Thionville - Esch/Alzette - Longwy",
    l90Name: "Luxembourg - Nancy (sillon lorrain)"
}

var l10segments = [ 1, 12, 13 ]
var l30segments = [ 2, 24 ]
var l50segments = [ 8 ]
var l60segments = [ 3, 31, 4, 41, 42, 5, 7, 71 ]
var l70segments = [ 6, 7, 71, 72 ]
var l80segments = [ 74, 5, 44 ]
var l90segments = [ 3 ]

var active = l50segments

Object.keys(gaLigneInfo).forEach(function (segment) {
    if ($.inArray(parseInt(segment.match(/\d+/)[0]), active) != -1) {
        for (var i=0; i < gaLigneInfo[segment].length; i++) {
            console.log('    <wpt lat="' + gaLigneInfo[segment][i]['lat'] + '" lon="' + gaLigneInfo[segment][0]['lon'] + '">')
            console.log("         <name>" + gaLigneInfo[segment][i]['id'] + "</name>")
            console.log("    </wpt>")
        };
    };
});
console.log("</gpx>")
});