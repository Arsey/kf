/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, requirejs */


define([
    'backbone',
    'preloader',
    'promises!homepage',
    'promises!about',
    'promises!posts',
    'promises!posts_inner',
    'promises!contact',
    'promises!gallery',
    'promises!showroom',
    'promises!showroom_front',
    'promises!showroom_architectural',
    'promises!production'
], function (
    Backbone,
    preloader,
    homepage,
    about,
    posts,
    post,
    contact,
    gallery,
    showroom,
    showroom_front,
    showroom_architectural,
    production
) {
    'use strict';
    var App = Backbone.Router.extend({
        initialize: function () {
            var _self = this;
            /* prevent defaults */
            document.documentElement.addEventListener('click', function (event) {
                var target = event.target;
                while (target && target.nodeName !== 'A') {
                    target = target.parentNode;
                }
                if (target) {
                    if (target.hostname === window.location.hostname) {
                        event.preventDefault();
                        _self.navigate(target.pathname, true);
                    }
                }
            }, true);
            
            /* start history */
            Backbone.history.start({pushState: true});
        },
        routes: {
            "": "home",
            "/": "home",
            "about": "about",
            "contact": "contact",
            "posts": "posts",
            "gallery": "gallery",
            "catalog": "showroom",
            
            "production": "production",
            "posts/:slug": "posts_inner",
            
            "catalog/architectural": "showroom_architectural",
            "catalog/front": "showroom_front"
        },
        production: function () {
            preloader.subloading(production);
        },
        showroom: function () {
            preloader.subloading(showroom);
        },
        showroom_architectural: function () {
            preloader.subloading(showroom_architectural);
        },
        showroom_front: function () {
            preloader.subloading(showroom_front);
        },
        gallery: function () {
            preloader.subloading(gallery);
        },
        home: function () {
            preloader.subloading(homepage);
        },
        about: function () {
            preloader.subloading(about);
        },
        posts: function () {
            preloader.subloading(posts);
        },
        contact: function () {
            preloader.subloading(contact);
        },
        posts_inner: function (slug) {
            post.load(slug);
        }
    });
    window.application = new App();
});
