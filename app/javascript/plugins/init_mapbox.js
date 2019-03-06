import mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 11 , linear: true });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/mapbox/outdoors-v9'
      style: 'mapbox://styles/mapbox/streets-v9'
      // style: 'mapbox://styles/mapbox/satellite-streets-v9'

    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '30px';
      element.style.height = '30px';
      element.dataset.spot = marker.spot;




    //   const popup = new mapboxgl.Popup({
    // closeButton: false,
    // closeOnClick: false
    // }).setHTML(marker.infoWindow);

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        // .setPopup(popup)
        .addTo(map);

    });

    fitMapToMarkers(map, markers);

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));


  }
  const markers = document.querySelectorAll(".mapboxgl-marker");
  markers.forEach((marker)=>{
    marker.addEventListener('mouseover', (event)=>{
      const spot = event.currentTarget.dataset.spot;
      const card = document.querySelector(`#result-${spot}`);
      card.classList.add("selected");
    });
  });

  markers.forEach((marker)=>{
    marker.addEventListener('mouseout', (event)=>{
      const spot = event.currentTarget.dataset.spot;
      const cardOld = document.querySelector(`.new_card-container.selected`);
      if(cardOld) {
        cardOld.classList.remove("selected");
    }
    });
  });
  markers.forEach((marker)=>{
      marker.addEventListener('click', (event)=>{
        const spot = event.currentTarget.dataset.spot;
        const card = document.querySelector(`#result-${spot}`);


        card.querySelector('a').click();
      });
    });


 const selectedCards = document.querySelectorAll(".new_card-container");
  selectedCards.forEach((selectedCard)=>{
    selectedCard.addEventListener('mouseover', (event)=>{
      const spot = event.currentTarget.dataset.spot;
      const marker = document.querySelector(`[data-spot='${spot}']`);

      marker.classList.add("selected");
    });
  });

    selectedCards.forEach((selectedCard)=>{
      selectedCard.addEventListener('mouseout', (event)=>{
        const spot = event.currentTarget.dataset.spot;
        const markerOld = document.querySelector(`.mapboxgl-marker.selected`);
        if(markerOld) {
          markerOld.classList.remove("selected");
      }
      });
    });





















};

export { initMapbox };
