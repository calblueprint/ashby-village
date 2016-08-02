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
//= require components
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require jquery.joyride-2.1
//= require_tree .

//this is the most recent version

function validateEmailReset(email) {
  var unique = isEmailUnique(email);
  if (unique) {
    $(".email-not-exist").show();
  } else {
    $(".emailError").hide();
    $(".email-not-exist").hide();
  }
}

var ready_error = function() {
  if ($('.flash_error').length > 0) {
    var error = $('.flash_error').html();
    if (error.indexOf("sign_in") > -1 ) {
      $('#login').foundation('reveal', 'open');
      $('.incorrect-login').show();
    } else if (error.indexOf("password_reset") > -1) {
      $('#forgot-password').foundation('reveal', 'open');
      validateEmailReset('pw_email');
    } else if (error.indexOf('registrations-reset-pw') > -1) {
      $('.reset_password_mismatch').show();
    } else if (error.indexOf("match") > -1) {
      $('.password_mismatch').show();
    } else if (error.indexOf("userauth") > -1) {
      $('#login').foundation('reveal', 'open');
      $('.user-auth').show();
    }
  }
}

var resize_ready = function() {
  resize_events_show();
  resize_navbar();
};

var ready = (function(){
  $(document).on('close.fndtn.reveal', '[data-reveal]', function(){
    $('.login-form-error-msg').hide();
    $('.user-auth').hide();
    $('.pw-form-error-msg').hide();
    $("#pw_email").removeClass("form-error");
  });
  $(document).foundation();
  ready_error();
  ready_user_show();
  ready_user_new();
  ready_user_edit();
  ready_users_registrations_new();
  ready_groups_index();
  ready_groups_show();
  ready_groups_new();
  ready_events_show();
  ready_events_new();
  ready_image_preview();
  ready_help();
  $(window).resize(resize_ready);
  $(window).trigger('resize');
});

// Document ready for Turbolinks (will only fire once).
// Without this it'll run before the page is finished loading.
$(document).on('page:change', ready);
