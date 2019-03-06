const refreshPage = () => {
  const form = document.querySelector("#automatic-refresh");

  // if (form.classList.contains('open')) {
  // } else {
  //   form.submit();
  // };
  form.addEventListener('change', (event)=>{
      form.submit();
  })

};

export { refreshPage };

// importer la fonction dans JS global
