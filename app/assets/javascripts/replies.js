// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready = function() {
  $(".reply-button").hide();

  $( ".reply-content" ).focus(function() {
    // TODO: Use next function instead?
    $( this ).siblings(".reply-button").show();

    var container = $(this);
    hideReplyContainer(container);
  });

  function hideReplyContainer(container) {
    $(document).mouseup(function (e) {
      var input = container.val().length;
      console.log(container.val().length);
      if (!container.is(e.target) && container.has(e.target).length === 0 && input === 0) {
          container.siblings(".reply-button").hide();
      }
    });
  }
}
$(document).ready(ready);
$(document).on("page:load", ready);
