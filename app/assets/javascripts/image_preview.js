var ready_image_preview = (function() {
  $('.uploadFile').on('change', function(event) {
    var files = event.target.files;
    var image = files[0];
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('.photoPreview').attr("src",img.src);
      $('.groupPhotoPreview').attr("src",img.src);
      $('.groupPhotoPreview').css({"height": "256px", "width": "100%", "object-fit": "cover"})
    };
    reader.readAsDataURL(image);
  });
});
