console.log("Hello from app/javascript/packs/application.js!");

import 'bootstrap';
import 'select2/dist/css/select2.css';
import "../plugins/flatpickr";
import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { tabEffect } from '../components/tab';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { cardEffect } from '../components/card';
import { initHome } from '../components/init_home';

if ( document.querySelector(".select2") ) {
  initSelect2();
}
if ( document.querySelector(".navbar-wagon") ) {
  initUpdateNavbarOnScroll();
}

previewImageOnFileSelect();

if ( document.querySelector(".tab_container") ) {
  tabEffect();
}
if ( document.querySelector("#map") ) {
  initMapbox();
}
if ( document.querySelector(".spot_location") ) {
  initAutocomplete();
}
if ( document.querySelector(".snip1360") ) {
  cardEffect();
}
if ( document.querySelector("#home-splash") ) {
  initHome();
}
