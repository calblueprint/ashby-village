function validateName(x) {
  alert("asdfhaksgdfkjadhf");
  bool = false;
  var i;
  var str = document.getElementById(x).value;
  str = str.trim();
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

// var ready = function() {
//   validateName('pass');
// };

// $(document).ready(ready);
// $(document).on("page:load", ready);

