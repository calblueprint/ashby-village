// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.

var ready = function() {
	// Override default behavior of exposed reply buttons
	$("#posts").bind("DOMSubtreeModified", function() {
		$(".reply-button").hide();
	});

	// Until posts becomes more AJAX-y, refresh the page
	$("#new_post input[type='submit']").click(function() {
		if ($("#post_content").val().length > 0) {
			location.reload();
		}
	});
}

$(document).ready(ready);
$(document).on("page:load", ready);