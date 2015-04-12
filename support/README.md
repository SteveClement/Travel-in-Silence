This contains various update scripts


Importing Train stations in a plist
-----------------------------------

To convert the current map.data-gares.js to a plist open 'gares-to-plist.html' in a Web Browser.
This will fetch 'http://www.cfl.lu/espaces/voyageurs/en/_vti_bin/CFLServices/CFLClientService.svc/GetMapDataGares/en' and do the necessary to output a XML plist on the JavaScript console. All you need to do now is right-click, save as.

Hacking
-------

To get beautified versions of the JavaScript install js-beautify

pip install jsbeautifier

wget -qO- http://www.cfl.lu/espaces/voyageurs/en/_vti_bin/CFLServices/CFLClientService.svc/GetMapDataGares/en |js-beautify -i > map.data-gares-beautified.js

Copies for backup are provided.

ToDo
----


- Write a parser to generate a GPX-file from the 'map.data-segments.js' file.
This can be used to test the journey in Xcode.

- Add the co-ordinates of the Stations on the Nancy-Luxembourg track
- Add the co-ordinates of the Stations on the Thionville-Esch-Luxembourg track
