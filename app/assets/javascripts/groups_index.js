var ready_groups_index = function() {

// TODO: Fix this condition so that it uses rails paths
if (!top.location.pathname.includes("users")) {

  updateListing();
  $(".inactive").hide();
  updateGroupCount();
}

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

  function leave_group(group_id) {
    $button.removeClass("is-member");
    $button.removeClass("remove-member");
    $button.text("Join Group");
    $.ajax({
      type: "PUT",
      url: "/groups/" + $button.attr("value") + "/leave",
      success: function(data) {
        var group = $(".group_id" + group_id);
        group.removeClass("active");
        group.removeClass("inactive");
        group.removeClass("my");
        if ($(".group-dropdown").val() === "my") {
          group.hide();
        }
        group.addClass("" + data.state);
        $(".inactive").hide();
        updateGroupCount();
        $(".user-no-groups").text("You are not a leader of any groups.");

      },
      dataType: 'json'
    });
  }
        //
        // Upon making the group inactive, we want to make the div reflect that state

  // Group tile logic
  $(".group-tile").click(function() {
      $tile = $(this);
      var path = $tile.find("h3").text().replace(/\s+/g, '-').toLowerCase();
      location.replace("/groups/" + path);
  });

  // Join group button logic
  $(".group-tile button").click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    $button = $(this);
    if ($button.hasClass("is-member") && $button.hasClass("leader-true")) {
      var confirmLeave = confirm("You are the only leader of this group, if you remove your membership this group will become inactive. Are you sure you want to remove your membership?");
      if (confirmLeave === true) {
        leave_group($button.attr("value"));
      }
    } else if ($button.hasClass("is-member")) {
      leave_group($button.attr("value"));
    } else {
      $button.addClass("is-member");
      $button.text("You Have Joined");

      $.ajax({
        type: "PUT",
        url: "/groups/" + $button.attr("value") + "/join",
        success: function() {
          var group_id = $button.attr("value");
          $(".group_id" + group_id).addClass("my");
        }
      });

    }
  });

  $(".group-tile button").hover(function() {
    $button = $(this);
    if ($button.hasClass("is-member")) {
      $button.addClass("remove-member");
      $button.text("Remove Membership");
    }
  },
  function() {
    if ($button.hasClass("is-member")) {
      $button.removeClass("remove-member");
      $button.text("You Have Joined");
    }
  });
};
