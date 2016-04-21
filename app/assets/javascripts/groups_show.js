var ready = function() {
  // $(".group-join").click(function(){
  //   $.ajax({
  //     type: "PUT",
  //     url: "/groups/" + $(this).attr("value") + "/join",
  //     success: function() {
  //       var members = $(".listing-member").attr("value");
  //       $(".member").text("Members " + members);
  //     }
  //   });
  //   $(this).removeClass("group-join");
  //   $(this).addClass("group-joined");
  //   $(this).prop("disabled", true);
  //   $(this).text("You Have Joined");
  //   $(".false").show();
  // });

  $(".false").hide();
  $(".group-new-post").show();
  $(".group-posts").show();
  $(".click-bulletin").addClass("selected");
  $(".group-member-listing").hide();
  $(".group-settings").hide();
  $(".group-events").hide();

  $(".click-bulletin").click(function() {
    $(".click-group-events").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").show();
    $(".group-posts").show();
    $(".group-member-listing").hide();
    $(".group-settings").hide();
    $(".group-events").hide();
  });

  $(".click-group-events").click(function() {
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-bulletin").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-posts").hide();
    $(".group-member-listing").hide();
    $(".group-settings").hide();
  });

  $(".click-member-listing").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-member-listing").show();
    $(".group-settings").hide();
    $(".group-posts").hide();
    $(".group-events").hide();
  });

  $(".click-group-settings").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-settings").show();
    $(".group-member-listing").hide();
    $(".group-posts").hide();
    $(".group-events").hide();
  });

  $(".click-group-events").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-description").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-settings").hide();
    $(".group-member-listing").hide();
    $(".group-posts").hide();
    $(".group-events").show();
  });

  $(".click-description").click(function() {
    $(".click-bulletin").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-settings").hide();
    $(".group-member-listing").hide();
    $(".group-posts").hide();
    $(".group-events").hide();
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
$(document).on("page:change", ready);
