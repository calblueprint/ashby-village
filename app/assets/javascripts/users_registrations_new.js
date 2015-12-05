var ready = function() {
  $(".click-register").click(function() {
    $(".register-modal").foundation("reveal", "open");
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);

$(function() {
 return $(".phone").mask("(999) 999-9999");
});
