
/**
* GoogleMapController is used to controller the google map for the rockClimbing project
* ToDO: add a function that on marker hover will have a box appear to give more info about the location
* 			add the ability to turn on and off the ability to drag to move markers
*				add the ability to drag or change zoom on the the map and get the new parameters for use
*/
var GoogleMapController = function(data) {

	/*constants*/
	var PIN_COLOR = "99CCFF";
	var PIN_SIZE = new google.maps.Size(21, 34);
	var PIN_POINT1 = new google.maps.Point(0,0);
	var PIN_POINT2 = new google.maps.Point(10, 34);
	var PIN_RESOURCE = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|";
	var PIN_IMAGE = new google.maps.MarkerImage(PIN_RESOURCE + PIN_COLOR, PIN_SIZE, PIN_POINT1, PIN_POINT2);

	/**
	* initialize the map
	*/
	this.markerArray = [];
	var mapOptions = {
		center: { lat: 38, lng: -100 },
		zoom: 2,
		scrollwheel: false,
		navigationControl: false,
		mapTypeControl: false,
		scaleControl: false,
		draggable: false,
		zoomControl: false,
		panControl: false,
		streetViewControl: true,
		mapTypeId: google.maps.MapTypeId.TERRAIN
	};

	if(data != null && data != 'undefined') {

		var latitude = data.latitude;
		var longitude = data.longitude;
		if( typeof latitude ===  typeof "string") {
			latitude = Number(latitude);
		}
		if( typeof longitude === typeof "string") {
			longitude = Number(longitude);
		}
		mapOptions.center.lat = latitude;
		mapOptions.center.lng = longitude;
		mapOptions.zoom = data.zoom;
	}
  // creates the map itself
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
      

	/**
	* addMarker will add a single marker to the map with listener functions
	* take the latitude, longitude, and title of the marker	
	* returns the new marker
	*/
	this.addMarker = function(lat, lng, title) {
		if( typeof lat ===  typeof "string") {
			lat = Number(lat);
		}
		if( typeof lng === typeof "string") {
			lng = Number(lng);
		}
		var myLatlng = new google.maps.LatLng(lat,lng);
		// To add the marker to the map, use the 'map' property
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: title,
			icon: PIN_IMAGE
		});
		// add the marker to the end of the array
		this.markerArray.push(marker);
		return marker;
	};

	this.addLink = function(marker, link) {
		marker.url = link;
		google.maps.event.addListener(marker, 'click', function() {
			window.location.href = this.url;
		});
	};

	/**
	* zoomBind will bind together an input and the google map zoom controls
	*/
	this.zoomBind = function(input) {
		// save the current zoom level
    var zoom = input.value;
    if(typeof zoom === typeof "String") {
      zoom = parseInt(zoom);
    }
    if(zoom > 16 || zoom < 0 || zoom == null || zoom === "undefined" || isNaN(zoom)) {
    	zoom = 2;
    }
    console.log(typeof zoom + ": " + zoom);

    // turn on zoom control
    mapOptions.zoomControl = true;
    // set zoom value
    mapOptions.zoom = zoom;
    map.setOptions(mapOptions);

    // add listener
    google.maps.event.addListener(map, 'zoom_changed', function() {
      console.log("listener: " + this.getZoom());
      document.getElementById("zoom").value = this.getZoom();
    });
  	
  	input.addEventListener('blur', function() {
  		var zoomValue = input.value;
  		if(typeof zoomValue === typeof "String") {
      	zoomValue = parseInt(zoomValue);
    	}
    	if(zoomValue > 16 || zoomValue < 0 || zoomValue == null || zoomValue === "undefined" || isNaN(zoomValue)) {
    		zoomValue = 2;
    	}
    	console.log("input Zoom listener: " + zoomValue);
  		map.setZoom(zoomValue);
  	}, false);
	}

	/**
	* this will bind longitude and latitude inptus to map movements
	*/
	this.moveBind = function(latitudeInput, longitudeInput) {
		// get input values
		var latitude = latitudeInput.value;
		if(typeof latitude === typeof "String") {
      latitude = parseFloat(latitude);
    }
    if(latitude == null || latitude === "undefined" || isNaN(latitude)) {
    	latitude = 0;
    }
    var longitude = longitudeInput.value;
    if(typeof longitude === typeof "String") {
      longitude = parseFloat(longitude);
    }
    if(longitude == null || longitude === "undefined" || isNaN(longitude)) {
    	longitude = 0;
    }

		// turn on map control and set option to input values
		mapOptions.center.lat = latitude;
		mapOptions.center.lng = longitude;
		mapOptions.draggable = true;
		mapOptions.panControl = true;
    map.setOptions(mapOptions);

    // add listener to the map
    google.maps.event.addListener(map, 'center_changed', function() {
    	latitude = this.getCenter().k;
      longitude = this.getCenter().D;

      if(longitude < -180) {
        var dif = longitude - -180;
        longitude = 180 + dif;
        var myLatLng = new google.maps.LatLng(latitude, longitude);
        this.setCenter(myLatLng);
      }

      if(longitude > 180) {
        var dif = longitude - 180;
        longitude = -180 + dif;
        var myLatLng = new google.maps.LatLng(latitude, longitude);
        this.setCenter(myLatLng);
      }

      latitudeInput.value = latitude;
      longitudeInput.value = longitude;
    });

    // create a lat lng listener for the input fields
    var latLngListener = function() {
    	// getValues
  		var lat = latitudeInput.value;
  		if(typeof lat === typeof "String") {
      	lat = parseFloat(lat);
    	}
    	if(lat == null || lat === "undefined" || isNaN(lat)) {
    		lat = 0;
    	}
    	var lng = longitudeInput.value;
  		if(typeof lng === typeof "String") {
      	lng = parseFloat(lng);
    	}
    	if(lng == null || lng === "undefined" || isNaN(lng)) {
    		lng = 0;
    	}
    	console.log("input latlng listener: " + lat + ", " + lng );
  		var myLatLng = new google.maps.LatLng(lat, lng);
      map.setCenter(myLatLng);
  	}
    
    // add latLngListener to the inputs
    latitudeInput.addEventListener('blur', latLngListener, false);
    longitudeInput.addEventListener('blur', latLngListener, false);

	};

	/**
	* sets the map zoom to the specified value
	*/
	this.setZoom = function (zoomValue) {
		if(typeof zoomValue !== typeof 1) {
      zoomValue = parseInt(zoomValue);
    }
    console.log("setZoom: " + zoomValue);
		map.setZoom(zoomValue);
	};

	/**
	* sets the map to a new center
	*/
	/*this.setCenter = function(latitude, longitude) {
		map.setCenter(latitude, longitude);
	};*/

	/**
	* sets the center of the map and its zoom level
	*/
	this.setMap = function(latitude, longitude, zoom) {
		mapOptions.center.lat = latitude; 
		mapOptions.center.lng = longitude;
    mapOptions.zoom = zoom;
    map.setOptions(mapOptions);
	};

	/**
	* resets the center of the map and its zoom level to the default possition
	*/
	this.resetMap = function() {
		this.removeAllMarkers();
		this.setMap(38, -100, 4);
	};

	/**
	* adds the specificed function to the specificed marker
	*/
	this.addFunction = function(marker, onClickFunction) {
		google.maps.event.addListener(marker, 'click', onClickFunction);
	};

	/**
	* removes all of the map markers
	*/
	this.removeAllMarkers = function() {
		var marker = this.markerArray.pop();
		while(marker != null) {
			marker.setMap(null);
			marker = this.markerArray.pop();
		}
	};
};



/***test functions***/
function runMapTests() {
	var controller = testObjectCreation();
	testAddMarker(controller);
	testMarkerLink(controller);
	testAddFunction(controller);
	testSetMap(controller);
	testRemoveMarkers(controller);
	testMapCreationWithData(controller);
}

function testObjectCreation() {
	var controller = new GoogleMapController();
	if(controller == null || controller == 'undefined') {
		console.log('failed testObjectCreation');
	}
	return controller;
}

function testAddMarker(controller) {
	for(var i = 0; i < 5; ++i) {
		controller.addMarker(35, 20 + (i*10), 'marker: ' + i.toString());
	}
	if(controller.markerArray.length != 5) {
		console.log('testAddMarker failed, only ' + controller.markerArray.length.toString() + ' markers added');
	}
}

function testMarkerLink(controller) {
	for(var i = 0; i < controller.markerArray.length; ++i) {
		controller.addLink(controller.markerArray[i], "https://www.google.com/#q=" + i.toString());
	}
}

function testAddFunction(controller) {
	for(var i = 0; i < 3; ++i) {
		var marker =  controller.addMarker(10 + i*10, 150, 'function: ' + i.toString());
		controller.addFunction(marker, function() {
			alert(this.title); // note 'this.' in this context will be the marker itself
		});
	}
}

function testSetMap(controller) {
	for(var i = 0; i < 3; ++i) {
		var marker =  controller.addMarker(1 + i*10, 10, 'zoom: ' + i.toString());
		controller.addFunction(marker, function() {
			controller.setMap(this.position.lat(), this.position.lng(), 10);
		});
	}
}

function testRemoveMarkers(controller) {
	var marker =  controller.addMarker(-20, -20, 'clear map');
	controller.addFunction(marker, function() {
		controller.removeAllMarkers();
	});
}

function testMapCreationWithData(controller) {
	var marker = controller.addMarker(-40, -65, 'make map with data');
	controller.addFunction(marker, function() {
		var data = {
			latitude: -40, longitude: -65, zoom: 5
		}
		controller.removeAllMarkers();
		controller = new GoogleMapController(data);
	});
}