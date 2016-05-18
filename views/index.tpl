<!doctype html>
<html class="no-js" lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Engenharia Univesp - Projeto integrador 8º bimestre - Santos SM2</title>
        <meta name="description" content="Aplicação para consulta à API do MLB.">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/normalize.css">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/sandstone/bootstrap.min.css" rel="stylesheet" integrity="sha384-QqZs0aSOGFan3GWVdP4PyCBp6icaF/4n8Q+wsmZUTiiVIqE4r4tFYcb8Osf+8y45" crossorigin="anonymous">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>


        <style type="text/css">
            #mapa-fundo{
                height: 100%;
                width: 100%;
                position:absolute;
                top: 0;
                left: 0;
                z-index: 0;
            }

            #mapa-alpha{
                height: 100%;
                width: 100%;
                position:absolute;
                top: 0;
                left: 0;
                z-index: 1;
                background:black;
                opacity: .65;
            }

            .box-topo{
              position: relative;
              z-index: 2;
              /*width: 300px;*/
              margin: 15px auto 0;
              padding: 0px 25px 0px 25px;
              height: auto;
              color: white;
            }

            #main {
              background: #0B0B61;
              opacity: .85;
              border-radius: 15px;
            }

            #results {
              background: white;
              color: black;
              opacity: .95;
              border-radius: 10px;
            }

            #map-results{
                border-radius: 10px;
                padding: 0px 25px 0px 25px;
            }

            .caret-button{
                float:right;
                top:15px;
            }

        </style>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div id="mapa-fundo"></div>
        <div id="mapa-alpha"></div>

        <div class="container box-topo" id="main">
            <div class="row">
                <!-- <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h1> -->
                <h3>Projeto integrador - Engenharia Univesp - 8º bimestre - Santos SM2</h3>
            </div>
            <div class="row">
                <form class="form-horizontal" method="get">
                <fieldset>

                <div class="form-group">
                  <div class="col-xs-11">
                        <input id="q" name="q" class="form-control" placeholder="caneca, camiseta, etc." type="text" required="" value="{{q}}">
                  </div>
                  <div class="col-xs-1">
                        <input class="btn btn-default" type="submit" value="Ok!">
                  </div>
                </div>
                </fieldset>
                </form>

            </div>
        </div>

        <div class="container box-topo" id="results">

            <div class="sr-only">{{d}}</div>

            <div class="caret-button">
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse-results" aria-expanded="true" aria-controls="collapse-results">
                    <span class="caret"></span>
                </button>
            </div>
            <div class="collapse in" id="collapse-results">

                <table class="table table-condensed">
                    <thead><tr><th>Imagem</th><th>Descrição</th><th>Preço</th><th>Distância</th></tr></thead>
                    <tbody>
                        %for produto in rows:
                          <tr>
                            <td><img src="{{produto['thumbnail']}}" /></td>
                            <td><a href="{{produto['permalink']}}">{{produto['index']}} - {{produto['title']}}</a></td>
                            <td>{{produto['price']}}</td>
                            <!--
                            <td>{{produto['latitude']}}</td>
                            <td>{{produto['longitude']}}</td>
                            <td>{{produto['distance']}}</td>
                            -->
                            <td>{{produto['distance_human']}}</td>
                          %end
                          </tr>
                        %end
                    </tbody>
                </table>

            </div>

        </div>

        <div class="container box-topo" id="map-results">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <img src="{{m}}" />
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.12.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
        -->




        <!-- Google API key  AIzaSyBhtd-yJe2grMYczNLGBjTGkPUKhzzf7gU

        https://maps.googleapis.com/maps/api/distancematrix/json?origins=-24.1163612,-46.6938933&destinations=-22.9105753,-43.1891424&key=AIzaSyAq-zrS-L7F0X-yF4zxDAu8nqY3jwIPk8A

        -->






        <!-- Include the Google Maps API library - required for embedding maps -->

        <script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

        <script type="text/javascript">

        // The latitude and longitude of your business / place
        var position = [-24.1163612, -46.6938933];

        function showGoogleMaps() {

            var latLng = new google.maps.LatLng(position[0], position[1]);

            var mapOptions = {
                zoom: 16, // initialize zoom level - the max value is 21
                streetViewControl: false, // hide the yellow Street View pegman
                scaleControl: true, // allow users to zoom the Google Map
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: latLng
            };

            map = new google.maps.Map(document.getElementById('mapa-fundo'),
                mapOptions);

            // Show the default red marker at the location
            marker = new google.maps.Marker({
                position: latLng,
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP
            });
        }

        google.maps.event.addDomListener(window, 'load', showGoogleMaps);

        </script>








    </body>
</html>
