var ready = function() {
  maskPhone();

  $(".click-register").click(function() {
    $(".register-modal").foundation("reveal", "open");
  });

  function maskPhone(){
    return $(".phone").mask("(999) 999-9999", { autoclear: false });
  };
};

$(document).ready(ready);
$(document).on("page:load", ready);
