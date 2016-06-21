var tour = "login"

var ready_help = function() {
  if(tour.toLowerCase() == "login"){
    $("#chooseID").joyride({autoStart : true});
  }
};
