var ready = function() {

  $(".click-details").addClass("selected");
  $(".click-details").trigger('click');

  $(".click-details").click(function() {
    $(".click-posts").removeClass("selected");
    $(".click-attendance").removeClass("selected");
    $(".click-event-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".event-post").addClass("hide-mobile");
    $(".event-organizers").addClass("hide-mobile");
    $(".attendance-list").addClass("hide-mobile");
    $(".event-details").removeClass("hide-mobile");
    $(".rsvp-button").removeClass("hide-mobile");
  });

  $(".click-posts").click(function() {
    $(".click-details").removeClass("selected");
    $(".click-attendance").removeClass("selected");
    $(".click-event-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".event-post").removeClass("hide-mobile");
    $(".event-organizers").addClass("hide-mobile");
    $(".attendance-list").addClass("hide-mobile");
    $(".event-details").addClass("hide-mobile");
    $(".rsvp-button").addClass("hide-mobile");
  });

  $(".click-attendance").click(function() {
    $(".click-details").removeClass("selected");
    $(".click-posts").removeClass("selected");
    $(".click-event-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".event-post").addClass("hide-mobile");
    $(".event-organizers").removeClass("hide-mobile");
    $(".attendance-list").removeClass("hide-mobile");
    $(".event-details").addClass("hide-mobile");
    $(".rsvp-button").addClass("hide-mobile");
  });

  $(".click-event-settings").click(function() {
    $(".click-details").removeClass("selected");
    $(".click-attendance").removeClass("selected");
    $(".click-posts").removeClass("selected");
    $(this).addClass("selected");
    $(".event-post").addClass("hide-mobile");
    $(".event-organizers").addClass("hide-mobile");
    $(".attendance-list").addClass("hide-mobile");
    $(".event-details").addClass("hide-mobile");
    $(".rsvp-button").addClass("hide-mobile");
  });

};

$(document).ready(ready);
$(document).on("page:change", ready);
