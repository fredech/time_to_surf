const initHome = () => {
  const input = document.querySelector(".where-trigger");
  const button = document.querySelector(".close-map");

  button.addEventListener('click', (event)=>{

    const map = document.querySelector(".home-map");
    map.classList.remove("map-display");
  })

  input.addEventListener('keyup', (event)=>{
    if (event.keyCode === 13 || event.keyCode === 9) {
      console.log(input.value);

      const map = document.querySelector(".home-map");

      map.classList.add("map-display");
    }

  })

}

export { initHome };
