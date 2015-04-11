/*
  map.voyageurs.js - copyright 2013, C-Services
  
  Contains the specific class/functions for the CFL's Voyageurs Maps 
  
*/
var gNoAction = false;
var gbZoomTest = false;
function TrainMap( sCanvas, bAdministrative, bZoomTest )
{
	this.aTrainLine = [];

	gbZoomTest = bZoomTest;
	
	//this.SimpleNet = function()
	//{
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270350, gaStationInfo.gare8271060, gaStationInfo.gare8200112, gaStationInfo.gare8270670, 
	//					   gaStationInfo.gare8270660, gaStationInfo.gare8200110, gaStationInfo.gare8270320, gaStationInfo.gare8270300, gaStationInfo.gare8270950,
	//					   gaStationInfo.gare8200120, gaStationInfo.gare8270730, gaStationInfo.gare8270480, gaStationInfo.gare8270630,
	//					   gaStationInfo.gare8271120, gaStationInfo.gare8270360,
	//					   gaStationInfo.gare8200134, gaStationInfo.gare8270700, gaStationInfo.gare8200136 ]);
						   
	//	this.SimpleLine([ gaStationInfo.gare8270630, gaStationInfo.gare8270710, gaStationInfo.gare8271143, gaStationInfo.gare8200142 ]);						  
	//	this.SimpleLine([ gaStationInfo.gare8200120, gaStationInfo.gare8200126 ]);
		
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270280, gaStationInfo.gare8270930, gaStationInfo.gare8270830, gaStationInfo.gare8270780, gaStationInfo.gare8270890, 
	//								gaStationInfo.gare8270210, gaStationInfo.gare8271080, gaStationInfo.gare8270690, gaStationInfo.gare8270720, gaStationInfo.gare8200340 ]);
									
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270180, gaStationInfo.gare8276932, gaStationInfo.gare8270270, gaStationInfo.gare8200520 ]);
												
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270160, gaStationInfo.gare8200603, gaStationInfo.gare8270800, gaStationInfo.gare8200630, 
	//							gaStationInfo.gare8200640, gaStationInfo.gare8200640, gaStationInfo.gare8270140, gaStationInfo.gare8270135, gaStationInfo.gare8270130, gaStationInfo.gare8270820, 
	//							gaStationInfo.gare8200920, gaStationInfo.gare8270790, gaStationInfo.gare8200930 ]);

	//	this.SimpleLine([ gaStationInfo.gare8200603, gaStationInfo.gare8200002, gaStationInfo.gare8200613, gaStationInfo.gare8200003, gaStationInfo.gare8270370 ]);
	//	this.SimpleLine([ gaStationInfo.gare8270800, gaStationInfo.gare8270640, gaStationInfo.gare8271010, gaStationInfo.gare8270910 ]);							
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270580, gaStationInfo.gare8270650, gaStationInfo.gare8270340, gaStationInfo.gare8270960, gaStationInfo.gare8270060, gaStationInfo.gare8200930, gaStationInfo.gare8200143, gaStationInfo.gare8200940 ]);						
	//	this.SimpleLine([ gaStationInfo.gare8200100, gaStationInfo.gare8270160, gaStationInfo.gare8200603 ]);
	//}
	
	//this.SimpleLine = function( aStation )
	//{
	//	var points = [];
	//	for(var iStation in aStation ) {
	//		points.push( new google.maps.LatLng( aStation[iStation].Position[1], aStation[iStation].Position[0] ) );
	//	}

	//	var polySegment = new google.maps.Polyline({ path: points, zIndex:0, strokeColor:'#bb0532', strokeWeight:4 });
	//	polySegment.setMap( this.map );	
	//}
	
	this.Ligne10 = function()
	{
		var oTrainLine = this.aTrainLine[10] = new TrainLine( this.map, "10", "#a6ce39", mapVoyageursResources.line10Name, "", "");
		
		oTrainLine.AddSegment( gaLigneInfo.segment1, -1 );
		//oTrainLine.AddSegment( gaLigneInfo.segment11, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment12, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment13, -1 );	

		
		oTrainLine.AddStations( [ gaStationInfo.gare8200100, gaStationInfo.gare8270350, gaStationInfo.gare8271060, gaStationInfo.gare8200112, gaStationInfo.gare8270670, 
						   gaStationInfo.gare8270660, gaStationInfo.gare8200110, gaStationInfo.gare8270320, gaStationInfo.gare8270300, gaStationInfo.gare8270950,
						   gaStationInfo.gare8200120, gaStationInfo.gare8200126, gaStationInfo.gare8270730, gaStationInfo.gare8270480, gaStationInfo.gare8270630,
						   gaStationInfo.gare8270710, gaStationInfo.gare8271143, gaStationInfo.gare8200142, gaStationInfo.gare8271120, gaStationInfo.gare8270360,
						   gaStationInfo.gare8200134, /*gaStationInfo.gare8270700,*/ gaStationInfo.gare8200136 ] );
	}

	this.Ligne30 = function()
	{
	    var oTrainLine = this.aTrainLine[30] = new TrainLine(this.map, "30", "#148e4c", mapVoyageursResources.line30Name, "", "");
		oTrainLine.AddSegment( gaLigneInfo.segment2, 0 );
		//oTrainLine.AddSegment( gaLigneInfo.segment21, 1 );
		//oTrainLine.AddSegment( gaLigneInfo.segment22, 1 );
		//oTrainLine.AddSegment( gaLigneInfo.segment23, 1 );
		oTrainLine.AddSegment( gaLigneInfo.segment24, 0 );
		oTrainLine.AddStations( [ 	gaStationInfo.gare8200100, gaStationInfo.gare8270280, gaStationInfo.gare8270930, gaStationInfo.gare8270830, gaStationInfo.gare8270780, gaStationInfo.gare8270890, 
									gaStationInfo.gare8270210, gaStationInfo.gare8271080, gaStationInfo.gare8270690, gaStationInfo.gare8270720, gaStationInfo.gare8200340 ], this.map );
									
	}

	this.Ligne50 = function()
	{
	    var oTrainLine = this.aTrainLine[50] = new TrainLine(this.map, "50", "#ffcb07", mapVoyageursResources.line50Name, "", "");
		oTrainLine.AddSegment(  gaLigneInfo.segment8, 1 );
		//oTrainLine.AddSegment( gaLigneInfo.segment81, 1 );
		
		oTrainLine.AddStations( [ gaStationInfo.gare8200100, gaStationInfo.gare8270180, gaStationInfo.gare8276932, gaStationInfo.gare8270270, gaStationInfo.gare8200520 ], this.map );	
	}
	

	this.Ligne60 = function()
	{
	    var oTrainLine = this.aTrainLine[60] = new TrainLine(this.map, "60", "#f29239", mapVoyageursResources.line60Name, "", "");
		oTrainLine.AddSegment(  gaLigneInfo.segment3, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment31, -1 );
		oTrainLine.AddSegment(  gaLigneInfo.segment4, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment41, 0 );
		oTrainLine.AddSegment( gaLigneInfo.segment42, -1 );
		//oTrainLine.AddSegment( gaLigneInfo.segment43, -1 );
		oTrainLine.AddSegment(  gaLigneInfo.segment5, 1 );
		oTrainLine.AddSegment(  gaLigneInfo.segment7, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment71, -1 );
		
		oTrainLine.AddStations( [ gaStationInfo.gare8200100, gaStationInfo.gare8270160, gaStationInfo.gare8200603, gaStationInfo.gare8200002, gaStationInfo.gare8200613, gaStationInfo.gare8200003, 
								gaStationInfo.gare8270370, gaStationInfo.gare8270800, gaStationInfo.gare8270640, gaStationInfo.gare8271010, gaStationInfo.gare8270910, gaStationInfo.gare8200630, 
								gaStationInfo.gare8200640, gaStationInfo.gare8200640, gaStationInfo.gare8270140, gaStationInfo.gare8270135, gaStationInfo.gare8270130, gaStationInfo.gare8270820, 
								gaStationInfo.gare8200920, gaStationInfo.gare8270790, gaStationInfo.gare8200930, gaStationInfo.gare8200143, gaStationInfo.gare8200940 ] );								
	}	

	this.Ligne70 = function()
	{
	    var oTrainLine = this.aTrainLine[70] = new TrainLine(this.map, "70", "#717ebd", mapVoyageursResources.line70Name, "", "");
		oTrainLine.AddSegment(  gaLigneInfo.segment6, 0 );
		oTrainLine.AddSegment(  gaLigneInfo.segment7, 0 );
		oTrainLine.AddSegment( gaLigneInfo.segment71, 0 );
		oTrainLine.AddSegment(  gaLigneInfo.segment72, 0 );
		
		oTrainLine.AddStations( [ gaStationInfo.gare8200100, gaStationInfo.gare8270580, gaStationInfo.gare8270650, gaStationInfo.gare8270340, gaStationInfo.gare8270960, gaStationInfo.gare8270060, gaStationInfo.gare8200930, gaStationInfo.gare8200143, gaStationInfo.gare8200940 ] );
	}


	this.Ligne80 = function()
	{
	    var oTrainLine = this.aTrainLine[80] = new TrainLine(this.map, "80", "#ec008c", mapVoyageursResources.line80Name, "", "");
		oTrainLine.AddSegment( gaLigneInfo.segment74, 1 );	
		oTrainLine.AddSegment( gaLigneInfo.segment5, -1 );
		oTrainLine.AddSegment( gaLigneInfo.segment44, 0 );
		
		oTrainLine.AddStations( [ gaStationInfo.gare8200940, gaStationInfo.gare8200143, gaStationInfo.gare8200930, gaStationInfo.gare8200920, gaStationInfo.gare8270140, gaStationInfo.gare8200640, gaStationInfo.gare8200630, gaStationInfo.gare8200603 ] );
	}
	
	this.Ligne90 = function()
	{
	    var oTrainLine = this.aTrainLine[90] = new TrainLine(this.map, "90", "#00b7f1", mapVoyageursResources.line90Name, "", "");
		oTrainLine.AddSegment( gaLigneInfo.segment3, 1 );
		oTrainLine.AddStations( [ gaStationInfo.gare8200100, gaStationInfo.gare8270160, gaStationInfo.gare8200603 ] );		
	}

	this.AddManAtWork = function (iLigne, sText, firstDotName, LastDotName, sDescription, sUrl)
	{
	    this.aTrainLine[iLigne].AddManAtWork(firstDotName, LastDotName, sText, sDescription, sUrl);
	}

	var stylesArray = [
	
		
	
		{
			"featureType": "water",
			"stylers": [
			  { "visibility": "off" }
			]
		},{
			"featureType": "poi",
			"stylers": [
			  { "visibility": "off" }
			]
		},{
			"featureType": "road.arterial",
			"elementType": "labels",
			"stylers": [
			  { "visibility": "off" }
			]
		},{
			"featureType": "road.local",
			"elementType": "labels",
			"stylers": [
			  { "visibility": "off" }
			]
		},{
			"featureType": "road.highway",
			"elementType": "labels",
			"stylers": [
			  { "visibility": "off" }
			]
		},{ 
			"featureType": "road.highway", 
			"elementType": "geometry.fill", 
			"stylers": [ 
				{ "color": "#a6a7a9" } 
			] 
		},{
			"featureType": "transit.station",
			"stylers": [{ "visibility": "off" }]
		}
	];
	
	if( bAdministrative )
	{
		stylesArray.push({ "featureType": "administrative.locality", "stylers": [{ "visibility": "off" }] });
	}
	
	var styledMap = new google.maps.StyledMapType( stylesArray, { name: 'map_style' });
	
	this.InitZoom = 10;
	this.InitCenter = new google.maps.LatLng( 49.815076, 6.100877 );
	
	var myOptions = { zoom: this.InitZoom, center: this.InitCenter, mapTypeControlOptions: { mapTypeId: [ google.maps.MapTypeId.ROADMAP, 'map_style' ] }, scrollwheel: true }
	this.map = new google.maps.Map( document.getElementById( sCanvas ), myOptions );	

	this.map.setOptions({streetViewControl: false});
	this.map.mapTypes.set( 'map_style', styledMap );
	this.map.setMapTypeId( 'map_style' );	
	
	var elem = document.createElement('canvas');
	this.isCanvasSupported = !!(elem.getContext && elem.getContext('2d'));
	
	// ligne 10 - vert claire
	this.Ligne10();

	// ligne 30 - vert fonce
	this.Ligne30();
	
	// ligne 50 - jaune orange
	this.Ligne50();
		
	// ligne 60 - orange
	this.Ligne60();
	
	// ligne 70 - bleu 
	this.Ligne70();
	
	// ligne 80 - rose
	this.Ligne80();
					
	// ligne 90 - bleu claire
	this.Ligne90();
	
	//if(! this.isCanvasSupported )
	//	this.SimpleNet();
	
	this.Init = function()
	{		
		InitLignes();
		InitStation();
	}	
	
	this.Reinit = function()
	{		
		this.map.setCenter( this.InitCenter );
        this.map.setZoom( this.InitZoom );
		
		ReInitLignes();
		ReInitStation();
	}	
	
	return this;
}