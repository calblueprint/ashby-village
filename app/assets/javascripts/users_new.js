$(".nameErrors").hide();
$(".phoneErrors").hide();
$(".emailError").hide();
$(".password_mismatch").hide();

name_fields = email_field = password_fields = phone_field = false;

function validateUser(x) {
  var str = document.getElementById(x).value;
  if (str.length == 0) {
    $("#" + x).addClass("form-error");
    name_fields = false;
    $(".register-button").attr("disabled", "disabled");
  }
  else if (/^[a-zA-Z]+$/.test(str)) {
    $("#" + x).removeClass("form-error");
    name_fields = true;
    $(".nameErrors").hide();

    if (password_fields && name_fields && phone_field && email_field) {
      $(".register-button").removeAttr("disabled", "disabled");
    };
  }
  else {
    $("#" + x).addClass("form-error");
    $(".nameErrors").show();
    name_fields = false;
    $(".register-button").attr("disabled", "disabled");
  };
};

function validatePhone(x) {
  var phone = document.getElementById(x).value.replace(/\D/g,'');
  if ( phone.length == 10 ) {
    $("#" + x).removeClass("form-error");
    $(".phoneErrors").hide();
    phone_field = true;

    if (password_fields && name_fields && phone_field && email_field) {
      $(".register-button").removeAttr("disabled", "disabled");
    };
  }
  else if (phone.length == 0) {
    $("#" + x).addClass("form-error");
    phone_field = false;
    $(".register-button").attr("disabled", "disabled");
    $(".phoneErrors").hide();
  }
  else {
    $("#" + x).addClass("form-error");
    $(".phoneErrors").show();
    phone_field = false;
    $(".register-button").attr("disabled", "disabled");
  };
};

function validateEmail(email) {
  var address = document.getElementById('email').value;
  var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
  var bool = re.test(address);
  if (address.length == 0) {
    $("#" + email).addClass("form-error");
    email_field = false;
    $(".register-button").attr("disabled", "disabled");
    $(".emailError").hide();
  }
  else if (bool == false) {
    $("#" + email).addClass("form-error");
    $(".emailError").show();
    email_field = false;
    $(".register-button").attr("disabled", "disabled");
  }
  else {
    $("#" + email).removeClass("form-error");
    $(".emailError").hide();
    email_field = true;

    if (password_fields && name_fields && phone_field && email_field) {
      $(".register-button").removeAttr("disabled", "disabled");
    };
  };
};

function isEmailUnique(email) {
  bool = false;
  var i;
  var address = document.getElementById('email').value;
  var arr = $('.temp_emails').data('temp');
  for (i=0; i < arr.length; i++) {
    if (arr[i] == address) {
      bool = true;
    }
  }
  if (bool) {
    $("#" + email).addClass("form-error");
    $(".email-taken").show();
  }
  else {
    $(".email-taken").hide();
  }
};

function validatePassword(password) {
  var pass = document.getElementById(password).value;
  if (pass.length == 0) {
    $("#"+ password).addClass("form-error");
    password_fields = false;
  }
};

function passwordMatching() {
  var pass1 = document.getElementById('pass').value;
  var pass2 = document.getElementById('pass_confirmation').value;
  if (pass1 == pass2) {
    $("#pass").removeClass("form-error");
    $("#pass_confirmation").removeClass("form-error");
    $(".password_mismatch").hide();
    password_fields = true;

    if (password_fields && name_fields && phone_field && email_field) {
      $(".register-button").removeAttr("disabled", "disabled");
    };
  }
  else {
    $("#pass").addClass("form-error");
    $("#pass_confirmation").addClass("form-error");
    $(".password_mismatch").show();
    password_fields = false;
    $(".register-button").attr("disabled", "disabled");
  };
};
