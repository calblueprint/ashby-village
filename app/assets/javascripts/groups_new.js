function remove_selected_leader(button) {
  var id = button.parentElement.id;
  button.parentElement.remove();
  index = group_leader_ids.indexOf(id);
  if(index > -1) {
    group_leader_ids.splice(index, 1);
  }
  $("#selected_leaders")[0].value = group_leader_ids;
};

function add_selected_leader(name, id) {
  var div = document.createElement('div');
  div.innerHTML = name + '<div type="button" class="x-leader" onclick="remove_selected_leader(this)"><i class="fa fa-times fa-lg"></i></div>';
  div.id = id;
  div.className += ' selected-leader';
  return div;
}

function validateGroupName(x) {
  if ($.inArray(document.getElementById(x).value.trim(), $('.group_names').data('temp')) > -1) {
    $("#" + x).addClass("form-error");
    $("#nameError").show();
  } else {
    $("#" + x).removeClass("form-error");
    $("#nameError").hide();
  }
}

function fixGroupNameError(x) {
  if (!$.inArray(document.getElementById(x).value.trim(), $('.group_names').data('temp')) > -1) {
    $("#" + x).removeClass("form-error");
    $("#nameError").hide();
  }
}

var group_leader_ids = [];

var ready_groups_new = function() {
  if($("#group_leaders").length > 0) {
    group_leader_ids = [];
    $("#group_leaders").bind('railsAutocomplete.select', function(event, data){
      // Add id's to array to pass to rails
      group_leader_ids.push(data.item.id);
      // Set hidden field
      $("#selected_leaders")[0].value = group_leader_ids;
      // Blank autocomplete field
      $("#group_leaders")[0].value = "";
      // Add Selected Name to new visible field
      $("#selected-group-leaders")[0].appendChild(add_selected_leader(data.item.value, data.item.id));
    });
    $("#group_leaders").keyup(function(){
      if($(".ui-helper-hidden-accessible").find("div:last").text() == "No search results."){
        $("#groupLeaderError").show();
      } else {
        $("#groupLeaderError").hide();
      }
    });
  }
}

