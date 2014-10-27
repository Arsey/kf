/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, requirejs */


requirejs.config({
    //By default load any module IDs from js/lib
    baseUrl: '/js/app',
    shim: {
        'modernizr-custom': {
            exports: 'Modernizr'
        },
        'wow': { 
            exports: 'WOW'
        },
        'snap.svg': {
            exports: 'Snap'
        }
    },
    paths: {
        // socketio: '//localhost:3000/socket.io/socket.io.js',
        backbone: '../../bower_components/backbone/backbone',
        underscore: '../../bower_components/underscore/underscore',
        jquery: '../../bower_components/jquery/dist/jquery',
        masonry: '../../bower_components/masonry/dist/masonry.pkgd.min',
        mustache: '../../bower_components/mustache/mustache'
    } 
});  




requirejs(['jquery', 'text', 'async', 'promises'], function ($) {
    requirejs(['app'], function () {
        console.log('app started')
    });
});
