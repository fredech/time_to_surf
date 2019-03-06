import mapboxgl from 'mapbox-gl';

const initMapboxShow = () => {
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 11 , linear: true });
  };

  // create a function to make a directions request
  function drawRoute(start, end) {
    // make directions request using cycling profile
    var url = 'https://api.mapbox.com/directions/v5/mapbox/driving/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + mapboxgl.accessToken;

    // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
    var req = new XMLHttpRequest();
    req.responseType = 'json';
    req.open('GET', url, true);
    req.onload  = function() {
      var data = req.response.routes[0];
      console.log(data.duration)

      // display itinerary duration
      document.getElementById("itinerary-duration").innerHTML = parseInt(data.duration / 60);
      document.getElementById("itinerary-distance").innerHTML = parseInt(data.distance / 1000);

      // draw route
      var route = data.geometry.coordinates;
      var geojson = {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "LineString",
          "coordinates": route
        }
      };

      map.addLayer({
        "id": "route",
        "type": "line",
        "source": {
          "type": "geojson",
          "data": {
            "type": "Feature",
            "properties": {},
            "geometry": {
              "type": "LineString",
              "coordinates": geojson
            }
          }
        },
        "layout": {
          "line-join": "round",
          "line-cap": "round"
        },
        "paint": {
          "line-color": "#3887be",
          "line-width": 5,
          "line-opacity": 0.75
        }
      });

      map.getSource('route').setData(geojson);
    };
    req.send();
  };

  const mapElement = document.getElementById('map_show');
  const markers = JSON.parse(mapElement.dataset.markers);
  const start = [markers[0].lng, markers[0].lat];
  const end   = [markers[1].lng, markers[1].lat];

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  var map = new mapboxgl.Map({
    container: 'map_show', // container id
    style: 'mapbox://styles/mapbox/streets-v11', //stylesheet location
    center: start, // starting position
    zoom: 12, // starting zoom
  });

  /// Markers
  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '40px';
    element.style.height = '40px';

    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });

  fitMapToMarkers(map, markers);

  // draw route
  map.on('load', function(){
    drawRoute(start, end);
  });
};

export { initMapboxShow };
