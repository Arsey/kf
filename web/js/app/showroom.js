/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, $ */

define(['page'], function (Page) {
    'use strict';

    var deferred = new $.Deferred();

    var Showroom = Page.extend({
        name: 'showroom',
        promise: deferred,
        showHook: function () {

        }
    });
    var showroom = new Showroom();
    return deferred.promise();
});
