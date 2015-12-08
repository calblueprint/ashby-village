var ready = (function() {
  $('.uploadFile').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('.photoPreview').attr("src",img.src);
    }
    reader.readAsDataURL(image);
    console.log("files",files);
    console.log("image", image);
  });
});

$(document).ready(ready);
$(document).on('page:load', ready);
