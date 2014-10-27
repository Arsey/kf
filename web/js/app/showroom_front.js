/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google */

define(['page'], function (Page) {
    'use strict'
    var deferred = new $.Deferred();
    
    var Page = Page.extend({
        name: 'showroom-front',
        promise: deferred,
        showHook: function () {
           
        }
    });
    new Page();
    return deferred.promise();
});