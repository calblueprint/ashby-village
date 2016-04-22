// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require_tree .



function validateEmailReset(email) {
  var unique = isEmailUnique(email);
  var valid = isValidEmail(email);
  if (unique) {
    $("#pw_email").addClass("form-error");
    $(".email-not-exist").show();
  } else if (!valid) {
    $("#pw_email").addClass("form-error");
    $(".emailError").show();
  } else {
    $("#pw_email").removeClass("form-error");
    $(".emailError").hide();
    $(".email-not-exist").hide();
  }
}

var ready_home_page_error = function() {
  if ($('.flash_error').length > 0) {
    var error = $('.flash_error').html()
    if (error.indexOf("sign_in") > -1 ) {
      $('#login').foundation('reveal', 'open');
      $('.login-form-error-msg').show()
    } else if (error.indexOf("password_reset") > -1) {
      $('#forgot-password').foundation('reveal', 'open');
      validateEmailReset('pw_email');
    }
  }
}

var ready = (function(){
  $(document).on('close.fndtn.reveal', '[data-reveal]', function(){
    $('.login-form-error-msg').hide();
    $('.pw-form-error-msg').hide();
    $("#pw_email").removeClass("form-error");
  });
  $(document).foundation();
  ready_home_page_error();
  ready_groups_show();
  ready_groups_index();
  ready_events_show();
  ready_users_registrations_new();
  ready_image_preview();
  ready_user_show();
  ready_user_new();
  event_new_ready();

  if($('.flash_error').length > 0) {
    ready_error_messages();
  }
  if($(".new_event").length > 0){
    ready_events_new();
  }
});

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:change', ready);
