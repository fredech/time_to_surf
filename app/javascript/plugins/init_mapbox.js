import mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 11 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v9'
      // style: 'mapbox://styles/mapbox/streets-v9'
      // style: 'mapbox://styles/mapbox/satellite-streets-v9'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
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

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
  }
};

export { initMapbox };
