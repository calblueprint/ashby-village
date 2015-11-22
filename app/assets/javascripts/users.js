$('#user_search').typeahead({
  name: "user",
  remote: "/user/autocomplete?query=%QUERY"
});
