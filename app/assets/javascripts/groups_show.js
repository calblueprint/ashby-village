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
  $(".click-new-post").addClass("selected");
  $(".group-member-listing").hide();
  $(".group-settings").hide();

  $(".click-new-post").click(function() {
    $(".click-group-events").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").show();
    $(".group-posts").show();
    $(".group-member-listing").hide();
    $(".group-settings").hide();
  });

  $(".click-group-events").click(function() {
    $(".click-member-listing").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-new-post").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-posts").hide();
    $(".group-member-listing").hide();
    $(".group-settings").hide();
  });

  $(".click-member-listing").click(function() {
    $(".click-new-post").removeClass("selected");
    $(".click-group-settings").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-member-listing").show();
    $(".group-settings").hide();
    $(".group-posts").hide();
  });

  $(".click-group-settings").click(function() {
    $(".click-new-post").removeClass("selected");
    $(".click-member-listing").removeClass("selected");
    $(".click-group-events").removeClass("selected");
    $(this).addClass("selected");
    $(".group-new-post").hide();
    $(".group-settings").show();
    $(".group-member-listing").hide();
    $(".group-posts").hide();
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
