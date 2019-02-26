console.log("Hello from app/javascript/packs/application.js!");

import 'bootstrap';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { tabEffect } from '../components/tab';
// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
// import { initMapbox } from '../plugins/init_mapbox';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
// import { initAutocomplete } from '../plugins/init_autocomplete';

initSelect2();
initUpdateNavbarOnScroll();
previewImageOnFileSelect();
tabEffect();
// inithover();
// initMapbox();
// initAutocomplete();
