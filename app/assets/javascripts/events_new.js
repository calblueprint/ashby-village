var ready_events_new = function() {
  $("#event_startdate")[0].onchange = function() {
    if($("#event_enddate").val() == ""){
      $("#event_enddate").val($("#event_startdate").val());
    }
  };
};
