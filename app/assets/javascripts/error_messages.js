
var ready = $(function() {
  $('.flash_error').fadeIn(0, function() {
    $(this).delay(2500).fadeOut('normal');
  });

  $('.flash_notice').fadeIn(0, function() {
    $(this).delay(2500).fadeOut('normal');
  });
});

$(document).ready(ready);
$(document).on("page:load", ready);
