function validateName(x) {
  bool = false;
  var i;
  var str = document.getElementById(x).value;
  var arr = $('.group_names').data('temp');
  var found = $.inArray(str, arr) > -1;
  if (found) {
    $("#" + x).addClass("form-error");
    $("#nameError").show();
  } else {
    $("#nameError").hide();
    $("#" + x).removeClass("form-error");
  }
}
