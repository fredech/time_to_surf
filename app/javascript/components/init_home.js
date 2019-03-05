const initHome = () => {
  const input = document.querySelector(".where-trigger");

  input.addEventListener('keyup', (event)=>{
    if (event.keyCode === 13 || event.keyCode === 9) {

      const map = document.querySelector(".home-map");

      map.classList.toggle("map-display");
    }

  })
}

export { initHome };
