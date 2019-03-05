import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector(".spot_location");
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
