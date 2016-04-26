var ready_groups_show = function() {
  $(".false").hide();

  function menu_clicked(event) { 
    // unselected others
    $(".click-group-events").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(".click-bulletin").removeClass("selected");
    
    // hide others
    $(".group-member-listing").hide();
    $(".group-settings").hide();
    $(".group-events").hide();
    $(".group-new-post").hide();
    $(".group-posts").hide();
    if($(".click-description:visible").length > 0){
      $(".info-box").hide();
    }

    $(this).addClass("selected");
    $(event.data.menu_item).show();
    if(event.data.additional) {
      $(event.data.additional).show();
    }
  }
  $(".click-bulletin").click({menu_item: ".group-posts", additional: ".group-new-post"}, menu_clicked);
  $(".click-group-events").click({menu_item: ".group-events"}, menu_clicked);
  $(".click-member-listing").click({menu_item: ".group-member-listing"}, menu_clicked);

  $(".click-group-settings").click({menu_item: ".group-settings"}, menu_clicked);
  $(".click-group-events").click({menu_item: ".group-events"}, menu_clicked);
  $(".click-description").click({menu_item: ".info-box"}, menu_clicked);

  $(".click-bulletin").trigger('click');
};
