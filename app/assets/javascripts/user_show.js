var ready_user_show = function() {
  $(".info").show();
  $(".click-info").addClass("selected");
  $(".groups-leading").hide();

  $(".click-info").click(function() {
    $(".click-groups").removeClass("selected");
    $(this).addClass("selected");
    $(".info").show();
    $(".groups-leading").hide();
  });

  $(".click-groups").click(function() {
    $(".click-info").removeClass("selected");
    $(this).addClass("selected");
    $(".info").hide();
    $(".groups-leading").show();
  });
};
