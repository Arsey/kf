/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google */

define(['jquery', 'page'], function ($, Page) {
    'use strict'
    var deferred = new $.Deferred();
    var Homepage = Page.extend({
        promise: deferred,
        name: 'homepage'
    });
    new Homepage();
    
    return deferred;
});