 $(document).ready(function() {
           $('form').submit(function(){
            var api_key = '38ed520286ab541243ddee4e7fe64fab';
            var city = $('input#city').val();
            $.get(`http://api.openweathermap.org/data/2.5/weather?q=${city}&units=imperial&appid=${api_key}`, function(data){
                $('.weather').append(data.name);
                var html = '';
                html += `<p> ${res['name']}: ${res['weather'][0]['description']} </p>`;
                html += `<p> Temperature:${res['main']['temp']} F</p>`;
                html += `<p> Coord: ${res['coord'].lat}, ${res['coord'].lon}`
                $('#results').html(html);
            }, 'jsonp');
            return false;
           })
        });