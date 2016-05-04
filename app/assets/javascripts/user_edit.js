var ready_user_edit = function() {
  if('ontouchstart' in window || navigator.msMaxTouchPoints){ // is touch screen
    $(".upload-pic").find("i").css("visibility", "visible");
  }
};
