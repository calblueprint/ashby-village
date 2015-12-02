var ready = function() {
  $(".info").show();
  $(".click-info").addClass("selected");
  // $(".groups").hide();

  $(".click-info").click(function() {
    $(".click-groups").removeClass("selected");
    $(this).addClass("selected");
    $(".info").show();
    $(".groups").hide();
  });

  $(".click-groups").click(function() {
    $(".click-info").removeClass("selected");
    $(this).addClass("selected");
    $(".info").hide();
    $(".groups").show();
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
