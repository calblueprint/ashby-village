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

var ready = (function(){ 
  $(document).foundation();
  ready_groups_show();
  ready_groups_index();
  ready_events_show();
  ready_users_registrations_new();
  ready_image_preview();
  ready_user_show();
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
