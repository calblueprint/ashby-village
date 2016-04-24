var ready_events_show = function() {

  function menu_clicked(event) { // event.data.menu_item must be present
    // unselect others
    $(".click-details").removeClass("selected");
    $(".click-posts").removeClass("selected");
    $(".click-attendance").removeClass("selected");
    $(".click-event-settings").removeClass("selected");

    // hide others on mobile
    $(".event-details").addClass("hide-mobile");
    $(".event-post").addClass("hide-mobile");
    $(".event-organizers").addClass("hide-mobile");
    $(".event-attendance").addClass("hide-mobile");
    $(".event-settings").addClass("hide-mobile");
    $(".rsvp-button").addClass("hide-mobile");

    $(this).addClass("selected");
    $(event.data.menu_item).removeClass("hide-mobile");
    if(event.data.additional) {
      $(event.data.additional).removeClass("hide-mobile");
    }
  }

  $(".click-details").click({menu_item: ".event-details", additional: ".rsvp-button"}, menu_clicked);
  $(".click-posts").click({menu_item: ".event-post"}, menu_clicked);
  $(".click-attendance").click({menu_item: ".event-attendance"}, menu_clicked);
  $(".click-event-settings").click({menu_item: ".event-settings"}, menu_clicked);

  if($(".event-menu:visible").length > 0){
    $(".click-details").trigger('click');
  }
};
