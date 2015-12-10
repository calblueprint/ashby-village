// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
var ready = function() {
  $(".reply-button").hide();

  $(".reply-content").focus(function() {
    $(this).siblings(".reply-button").fadeIn("fast");
    var container = $(this);
    hideReplyContainer(container);
  });

  $(".reply-content").focusout(function() {
  	$(this).siblings(".reply-button").fadeOut("slow");
  });

  function hideReplyContainer(container) {
    $(document).mouseup(function(e) {
      var input = container.val().length;
      console.log(container.val().length);
      if (!container.is(e.target) && container.has(e.target).length === 0 && input === 0) {
          container.siblings(".reply-button").hide();
      }
    });
  }

  $(".reply-button").click(function() {
    // Refresh page for each reply until this gets more AJAX-y
    if ($(this).siblings(".reply-content").val().length > 0) {
      location.reload();
    }
  });
}

$(document).ready(ready);
$(document).on("page:load", ready);
