var ready_groups_index = function() {
  updateListing();
  $(".inactive").hide();
  updateGroupCount();

  $(".neighborhood-dropdown").change(function() {
    updateListing();
    $(".inactive").hide();
    updateGroupCount();
  });

  function updateListing() {
    if($(".neighborhood-dropdown").length > 0) {
      var neighborhood = $(".neighborhood-dropdown").val().replace(/\^/g, "-");

      $(".group-tile").show();
      if (neighborhood != "all") {
        $(".group-tile").not("." + neighborhood).hide();
        $(".dropdowns-tile span").fadeOut("fast");
      } else {
        $(".dropdowns-tile span").fadeIn("fast");
      }
    }
  }

  function updateGroupCount() {
    if($(".neighborhood-dropdown").length > 0) {
      var groupCount = $(".group-tile").filter(function() {
        return $(this).css("display") !== "none";
      }).length;
      var neighborhood = $(".neighborhood-dropdown").val().replace(/\^/g, " ");
      if (neighborhood == "all") {
        neighborhood = "All Neighborhoods";
      }
      if (groupCount === 1) {
        $(".group-count").text("Displaying " + groupCount + " group in " + neighborhood);
      } else {
        $(".group-count").text("Displaying " + groupCount + " groups in " + neighborhood);
      }
    }
  }

  $(".group-tile button").click(function() {
    if('ontouchstart' in window || navigator.msMaxTouchPoints){ // is touch screen
      location.replace("/groups/" + $(this).val());
    } else {
      location.replace("/groups/" + $(this).val() + "/" + $(this).attr("title"));
    }
    // to prevent normal link to group
    return false;
  });

  if(!('ontouchstart' in window || navigator.msMaxTouchPoints)){ // is touch screen
    $(".group-tile button").hover(function() {
      button = $(this);
      if (button.hasClass("is-member")) {
        button.addClass("remove-member");
        button.text("Remove Membership");
      }
    },
    function() {
      if (button.hasClass("is-member")) {
        button.removeClass("remove-member");
        button.text("You Have Joined");
      }
    });
  }
};
