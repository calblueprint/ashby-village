function validatePhone(x) {
  var phone = document.getElementById(x).value.replace(/\D/g,'');
  if ( phone.length != 10 && phone.length > 0 ) {
    $("#" + x).addClass("form-error");
    $(".phoneErrors").show();
  }
  else {
    $("#" + x).removeClass("form-error");
    $(".phoneErrors").hide();
  };
};

function onFixedPhoneError(x) {
  var phone = document.getElementById(x).value.replace(/\D/g,'');
  if (phone.length == 10) {
    $("#" + x).removeClass("form-error");
    $(".phoneErrors").hide();
  }
}

function onFixedEmailError(email) {
  var unique = isEmailUnique(email);
  var valid = isValidEmail(email);
  if (unique && valid) {
    $("#email").removeClass("form-error");
    $(".emailError").hide();
    $(".email-taken").hide();
  }
}

function isValidEmail(email) {
  var address = document.getElementById(email).value;
  var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
  var bool = re.test(address);
  if (bool == false && address.length > 0) {
    return false;
  }
  else {
    return true;
  };
};

function isEmailUnique(email) {
  bool = false;
  var i;
  var address = document.getElementById(email).value;
  var arr = $('.temp_emails').data('temp');
  for (i=0; i < arr.length; i++) {
    if (arr[i] == address) {
      bool = true;
    }
  }
  if (bool) {
    return false;
  }
  else {
    return true;
  }
};

function validateEmail(email) {
  var unique = isEmailUnique(email);
  var valid = isValidEmail(email);
  if (!unique) {
    $("#email").addClass("form-error");
    $(".email-taken").show();
  } else if (!valid) {
    $("#" + email).addClass("form-error");
    $(".emailError").show();
  } else {
    $("#email").removeClass("form-error");
    $(".emailError").hide();
    $(".email-taken").hide();
  }
}

function passwordMatching() {
  var pass1 = document.getElementById('pass').value;
  var pass2 = document.getElementById('pass_confirmation').value;
  if (pass2.length >= pass1.length && pass1.length > 0) {
    if (pass1 == pass2) {
      $("#pass").removeClass("form-error");
      $("#pass_confirmation").removeClass("form-error");
      $(".password_mismatch").hide();
    }
    else {
      $("#pass_confirmation").addClass("form-error");
      $("#pass").addClass("form-error");
      $(".password_mismatch").show();
    }
  }
};

var ready_user_new = function() {
  if($(".res").length > 0){
    var val = $('.res')[0].title
    if (val == "1") {
      $(".password_error").show()
      validateEmail('email');
      validatePhone('phone');
    }
  }
};
