/*
	Ashby Village's custom JavaScript library for accessibility features.
*/

var ready = function() {

	// Highlight text to read aloud feature
	var t = '';
	function gText(e) {
		t = (document.all) ? document.selection.createRange().text : document.getSelection();
		var utterance = new SpeechSynthesisUtterance(t);
		var voices = window.speechSynthesis.getVoices();
		utterance.voice = voices[1];
		window.speechSynthesis.speak(utterance);
	}
	document.onmouseup = gText;
	if (!document.all) document.captureEvents(Event.MOUSEUP);

}

$(document).ready(ready);
$(document).on('page:load', ready);
