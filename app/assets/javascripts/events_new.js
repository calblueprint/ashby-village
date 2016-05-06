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
  if (datetime && Date.parse(Date()) >= Date.parse(datetime)) {
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
    &&  endDateTime
    && (Date.parse(endDateTime) < Date.parse(startDateTime) || Date.parse(endDateTime) < Date.parse(Date()))
    ) {
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

function remove_selected_organizer(button) {
  var id = button.parentElement.id;
  button.parentElement.remove();
  index = event_organizer_ids.indexOf(id);
  if(index > -1) {
    event_organizer_ids.splice(index, 1);
  }
  $("#selected_organizers")[0].value = event_organizer_ids;
};

function add_selected_organizer(name, id) {
  var div = document.createElement('div');
  div.innerHTML = name + '<div type="button" class="x-leader" onclick="remove_selected_organizer(this)"><i class="fa fa-times fa-lg"></i></div>';
  div.id = id;
  div.className = " selected-leader";
  return div;
}

var event_organizer_ids = [];

var ready_events_new = function() {
  if($("#event_startdate").length > 0) {
    $("#event_startdate")[0].onchange = function() {
      if($("#event_enddate").val() == ""){
        $("#event_enddate").val($("#event_startdate").val());
      }
    };
  
    // Function called when autocomplete has been selected
    $("#organizers").bind('railsAutocomplete.select', function(event, data){
      // Add id's to array to pass to rails (hidden_field_tag?)
      event_organizer_ids.push(data.item.id);
      // Set hidden field
      $("#selected_organizers")[0].value = event_organizer_ids;
      // Blank autocomplete field
      $("#organizers")[0].value = "";
      // Add Selected Name to new visible field
      $("#selected-event-organizers")[0].appendChild(add_selected_organizer(data.item.value, data.item.id));
    });
  }
};
