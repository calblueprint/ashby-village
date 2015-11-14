$(function() {

  updateGroupCount();

  $(".group-dropdown, .neighborhood-dropdown").change(function() {
    var kind = $(".group-dropdown").val();
    var neighborhood = $(".neighborhood-dropdown").val();

    $(".group-tile").show();
    if (kind != "all") {
      $(".group-tile").not("." + kind).hide();
    }
    if (neighborhood != "all") {
      $(".group-tile").not("." + neighborhood).hide();
      $(".dropdowns-tile span").fadeOut("fast"); 
    } else {
      $(".dropdowns-tile span").fadeIn("fast");
    }

    updateGroupCount();

  });

  function updateGroupCount() {
    var groupCount = $(".group-tile").filter(function() {
      return $(this).css('display') !== 'none';
    }).length;
    if (groupCount === 1) {
      $(".group-count").text("Displaying " + groupCount + " group");
    } else {
      $(".group-count").text("Displaying " + groupCount + " groups");
    }
  }

});
