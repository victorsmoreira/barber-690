const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-home');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-home-white');
        navbar.classList.add('navbar-light');
        navbar.classList.remove('navbar-dark');
      } else {
        navbar.classList.remove('navbar-home-white');
        navbar.classList.add('navbar-dark');
        navbar.classList.remove('navbar-light');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
