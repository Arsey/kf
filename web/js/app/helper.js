/* helper methods and properties */

/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Modernizr */

define([], function () {
    'use strict';
    var transEndEventNames = {
        'WebkitTransition': 'webkitTransitionEnd', // Saf 6, Android Browser
        'MozTransition': 'transitionend', // only for FF < 15
        'transition': 'transitionend' // IE10, Opera, Chrome, FF 15+, Saf 7+
    };
    var animationEndEventNames = {
        'WebkitAnimation': 'webkitAnimationEnd', // Saf 6, Android Browser
        'animation': 'animationend' // IE10, Opera, Chrome, FF 15+, Saf 7+
    };
    var transEventName = Modernizr.prefixed('transition');
    function loadCss(url, id) {
        if(document.getElementById(id))return;
        var link = document.createElement("link");
        link.type = "text/css";
        link.rel = "stylesheet";
        link.href = url;
        document.getElementsByTagName("head")[0].appendChild(link);
    }

    return {
        "transEndEventNames": transEndEventNames,
        "transEventName": transEventName,
        "animationEndEventNames": animationEndEventNames,
        animationEndEventName: animationEndEventNames[Modernizr.prefixed('animation')],
        transformEventName: Modernizr.prefixed('transform'),
        transEndEventName: transEndEventNames[transEventName],
        loadCss: loadCss
    };
});
