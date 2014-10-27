/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google */

define(['page', 'backbone', 'masonry'], function (Page, Backbone, Masonry) {
    'use strict'
    var deferred = new $.Deferred();
    var Posts = Page.extend({
        name: 'posts',
        promise: deferred,
        showHook: function () {
            var container = this.el.querySelector('.list');
            Array.prototype.forEach.call(container.querySelectorAll('.post'), function (el) {
                var seed = Math.random()*10
                if(seed>6){
                    if(seed>8){
                        el.classList.add('square-post')
                    }else{
                        el.classList.add('vertical-post')
                    }
                }
            });
            if(window.innerWidth>540){
                var msnry = new Masonry( container, {
                    itemSelector: '.post',
                    stamp: '.stamp'
                });
            }
        }
    });
    new Posts();
    return deferred;
});
