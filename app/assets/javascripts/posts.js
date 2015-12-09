// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.

var ready = function() {
	// Override default behavior of exposed reply buttons
	$("#posts").bind("DOMSubtreeModified", function() {
		$(".reply-button").hide();
	});
}

$(document).ready(ready);
$(document).on("page:load", ready);