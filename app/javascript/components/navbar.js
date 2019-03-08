const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-wagon-right');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight / 30) {
        navbar.classList.add('navbar-wagon-right-white');
      } else {
        navbar.classList.remove('navbar-wagon-white');
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
