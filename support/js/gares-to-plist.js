$.getScript("http://www.cfl.lu/espaces/voyageurs/en/_vti_bin/CFLServices/CFLClientService.svc/GetMapDataGares/en", function(){

console.log('<?xml version="1.0" encoding="UTF-8"?>')
console.log('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">')
console.log('<plist version="1.0">')
console.log("<dict>")
Object.keys(gaStationInfo).forEach(function (gare) {
console.log("   <key>" + gare + "</key>")
console.log("   <dict>")
console.log("       <key>Name</key>")
console.log("       <string>" + gaStationInfo[gare]['StaticName'] + "</string>")
console.log("       <key>Position</key>")
console.log("       <array>")
console.log("           <string>" + gaStationInfo[gare]['Position'][0] + "</string>")
console.log("           <string>" + gaStationInfo[gare]['Position'][1] + "</string>")
console.log("       </array>")
console.log("   </dict>")
});
console.log("</dict>")
console.log("</plist>")
});