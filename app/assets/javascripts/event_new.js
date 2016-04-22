function getDateTime(date, time) {
  if (date.length != 0 && time.length != 0) {
    if ( time.indexOf(".") != -1 ) {
      time = time.slice(0, -7);
    }
    var datetime = date + "T" + time + ":00-07:00";
    return datetime
  } else {
    return false;
  }

}

function validateEventStart() {
  var date = document.getElementById("event_startdate").value;
  var time = document.getElementById("event_starttime").value;
  var datetime = getDateTime(date, time);
  if (Date.parse(Date()) > Date.parse(datetime) && datetime) {
    $("#event_starttime").addClass("form-error");
    $("#event_startdate").addClass("form-error");
    $(".startdate_errors").show();
    return true
  } else {
    $("#event_starttime").removeClass("form-error");
    $("#event_startdate").removeClass("form-error");
    $(".startdate_errors").hide();
    return false
  }
}

function validateEventEnd() {
  var enddate = document.getElementById("event_enddate").value;
  var endtime = document.getElementById("event_endtime").value;
  var startdate = document.getElementById("event_startdate").value;
  var starttime = document.getElementById("event_starttime").value;

  startDateTime = getDateTime(startdate, starttime);
  endDateTime = getDateTime(enddate, endtime);

  if (startDateTime
    && (Date.parse(endDateTime) < Date.parse(startDateTime) || Date.parse(endDateTime) < Date.parse(Date()))
    &&  endDateTime) {
    $("#event_endtime").addClass("form-error");
    $("#event_enddate").addClass("form-error");
    $(".enddate_errors").show();
    return true
  } else {
    $("#event_endtime").removeClass("form-error");
    $("#event_enddate").removeClass("form-error");
    $(".enddate_errors").hide();
    return false
  }
}

var event_new_ready = function() {
  if ($("#event_enddate").length > 0) {
    validateEventEnd();
    validateEventStart();
  }
}
