function validateName(x) {
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

function fixGroupNameError(x) {
  var str = document.getElementById(x).value;
  str = str.trim();
  var arr = $('.group_names').data('temp');
  var found = $.inArray(str, arr) > -1;
  if (!found) {
    $("#nameError").hide();
    $("#" + x).removeClass("form-error");
  }
}

var ready_groups_new = function() {
  if ($("#new-group-name").length > 0) {
    validateName('new-group-name');
  }
}

