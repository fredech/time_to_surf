const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.querySelectorAll('.photo-input');

  input.forEach ((inputItem) => {
    inputItem.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(inputItem);
    });
  });
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById(input.dataset.target).src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById(input.dataset.target).classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };
