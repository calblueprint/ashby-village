var ready;
ready = function() {
    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.full_name);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            replace: function(root_url) {
                var query = [];
                query.push($('#user_search')[0].value);
                console.log(query);
                return root_url + query;  },
            url: '/users/autocomplete?query='
        }
    });

    var leaders = [];
    $('#user_search').on('typeahead:selected', function (e, datum) {
        leaders.push(datum.id);
    });

    $(".create-section input[type='submit']").click(function() {
        alert(JSON.stringify(leaders))
        $.ajax({
            type: "POST",
            url: "/groups/",
            data: JSON.stringify({json:leaders}),
            dataType: 'json'
    });
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
        displayKey: 'full_name',
        source: engine.ttAdapter()
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
