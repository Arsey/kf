/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google */

define(['page', 'backbone', 'preloader',  'async!http://maps.google.com/maps/api/js?v=3&libraries=places&sensor=true&language=uk'], function (Page, Backbone, preloader) {
    'use strict'
    var deferred = new $.Deferred();
    var Contact = Page.extend({
        'events': {
            'click button': 'getRoute'
        },
        name: 'contact',
        promise: deferred,
        location: [50.4168721,25.7504399],
        _center: new google.maps.LatLng(50.4168721, 25.7504399),
        center: new google.maps.LatLng(50.4168721-0.06, 25.7504399-.07),
        focus: function () {
            this.state = 'route';
            console.log('in')
            
            if (window.getComputedStyle(this.mapElement).display === 'none') {
                google.maps.event.trigger(this.map, 'resize');
                this.el.classList.add('focus');
            }else{
                this.el.classList.add('focus');
            }
            
            if (this.rendered) {
                this.getRoute()
            }
        },
        back: function () {
            this.state = 'false';
            console.log('out');
            this.el.classList.remove('focus');
            if (this.start) {
                this.start.setMap(null);
                this.start = null;
            }
            this.route.setMap(null);
            this.map.panTo(this.center)
            this.map.setZoom(11);
            
        },
        
        // TODO stop and run slider on page show
        getRoute: function () {
            var start = [50.41, 25.75].join(',');
            var mode = 'DRIVING';
            
            var request = {
                origin: start,
                destination: this.location.join(','),
                travelMode: google.maps.TravelMode[mode]
            };
            this.route.setMap(this.map);
            this.routeService.route(request, function (result, status) {
                if (status === google.maps.DirectionsStatus.OK) {
                    this.route.setDirections(result);
                }
                if (result.routes.length > 0) {
                    var myRoute = result.routes[0].legs[0];
                    if (this.start) {
                        this.start.setMap(null);
                        this.start = null;
                    }
                    this.start = new google.maps.Marker({
                        position: myRoute.steps[0].start_point,
                        map: this.map,
                        animation: google.maps.Animation.NONE,
                        //icon: 'img/marker-small.svg'
                    });
                    this.map.panTo(this._center)
                    this.map.setZoom(13);
                }
                
            }.bind(this));
        },
        showHook: function () {
            google.maps.event.trigger(this.map, 'resize');
        },
        render: function () {
            /* options */
            var mapOptions = {
                center: new google.maps.LatLng(50.4168721-0.06, 25.7504399-.07),
                zoom: 11,
                zoomControl: false,
                disableDoubleClickZoom: true,
                mapTypeControl: false,
                scaleControl: false,
                panControl: false,
                scrollwheel: true,
                streetViewControl: false,
                draggable: true,
                overviewMapControl: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            
            /* style */
            var styles = [
                {
                    "featureType": "landscape",
                    "stylers": [
                        {
                            "color":"#e6ebee"
                        },
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "road.highway",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "color": "#566975"
                        }
                    ]
                },
               
                {
                    "featureType": "road.highway",
                    "elementType": "labels.text",
                    "stylers": [
                        {
                            "color": "#000000"
                        }
                    ]
                },
                {
                    "featureType": "road.highway",
                    "elementType": "labels.text.fill",
                    "stylers": [
                        {
                            "color": "#ffffff"
                        }
                    ]
                },
                
                
                {
                    "featureType": "poi",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "transit",
                    "stylers": [
                        {
                            "color": "#566975"
                        },
                        {
                            "visibility": "off"
                        }
                    ]
                },
                
                {
                    "featureType": "administrative.province",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                
                {
                    "featureType": "water",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                        
                    ]
                },
                {
                    "featureType": "water",
                    "elementType": "labels",
                    "stylers": [
                        {
                            "visibility": "off"
                        }

                    ]
                }
            ];
    
    
            var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
            
            /* set-up map */
            this.mapElement = document.getElementById('map');
            this.map = new google.maps.Map(this.mapElement, mapOptions);
            this.map.mapTypes.set('map_style', styledMap);
            this.map.setMapTypeId('map_style');
            
            /* set-up routing helper */
            this.route = new google.maps.DirectionsRenderer({
                suppressMarkers: true,
                preserveViewport: true,
                polylineOptions: {
                    strokeColor: '#82c1ff',
                    strokeOpacity: 0.7,
                    strokeWeight: 6
                }
            });
            this.routeService = new google.maps.DirectionsService();
            
            /* add marker or routeh  when map loaded */
            this.rendered = true;
            google.maps.event.addListenerOnce(this.map, 'idle', this.startMap.bind(this));
            
        },
        startMap: function () {
            this.finish = new google.maps.Marker({
//                icon: 'img/contacts/pointer-big.svg',
                position: new google.maps.LatLng(this.location[0], this.location[1]),
                map: this.map,
                animation: google.maps.Animation.DROP
            });
            if (this.state === 'route') {
                this.getRoute();
            }
        }
    });
    new Contact();
    return deferred;
});