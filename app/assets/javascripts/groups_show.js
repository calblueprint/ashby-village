var ready = function() {
  $(".group-bulletin").show();
  $(".click-bulletin").addClass("selected");
  $(".group-member-listing").hide();
  $(".group-settings").hide();

  $(".click-bulletin").click(function() {
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".group-bulletin").show();
    $(".group-member-listing").hide();
    $(".group-settings").hide();
  });

  $(".click-member-listing").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".group-bulletin").hide();
    $(".group-member-listing").show();
    $(".group-settings").hide();
  });

  $(".click-group-settings").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(this).addClass("selected");
    $(".group-bulletin").hide();
    $(".group-settings").show();
    $(".group-member-listing").hide();
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
