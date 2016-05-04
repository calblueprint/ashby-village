var resize_navbar = function() {
  if($(window).width() < 640){
    $(".dropdown").children().each(function(index) {
      if(index > 1){
        $(".dropdown").parent().parent()[0].appendChild($(this)[0]);
      }
    });
  } else {
    $(".dropdown").parent().parent().children().each(function(index) {
      if(index > 2){
        $(".dropdown")[0].appendChild($(this)[0]);
      }
    });
  }
};
