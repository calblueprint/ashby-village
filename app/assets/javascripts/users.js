# app/assets/javascripts/users.js

var ready;
ready = function() {
    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.first_name);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '../users/autocomplete?query=%QUERY'
        }
    });

    var promise = engine.initialize();

    promise
        .done(function() { console.log('success })
        .fail(function() { console.log('err });

    $('.typeahead').typeahead(null, {
        name: 'engine',
        displayKey: 'first_name',
        source: engine.ttAdapter()
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);