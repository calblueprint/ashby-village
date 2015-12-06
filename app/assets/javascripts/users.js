var ready;
ready = function() {
    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.first_name);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            replace: function(root_url) {
                var query = $('#user_search')[0].value;
                console.log(query);
                return root_url + query;  },
            url: '/users/autocomplete?query='
        }
    });

    var promise = engine.initialize();

    promise.done(function() {
            console.log('success')
        });
    promise.fail(function() {
            console.log('err')
        });

    $('.typeahead').typeahead(null, {
        name: 'engine',
        displayKey: 'first_name',
        source: engine.ttAdapter()
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);

