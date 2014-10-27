/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _ */

define(['backbone','preloader', '../../bower_components/imagesloaded/imagesloaded.pkgd.js'], function (Backbone, preloader, ImagesLoaded) {
    'use strict';
    var Page = Backbone.View.extend({
        timer: null, // show timer
        name: 'pagename',
        initialize: function (options) {
            preloader.push(this.name);
            this.setElement(document.querySelector('.' + this.name));
            this.on('loaded', function () {
                this.promise.resolve(this);
                preloader.done(this.name);
            })
            this.initHook();
            this.preparePage();
        },
        initHook: function (options) {},
        preparePage: function () {
            var self = this;
            if (this.imagesReady || this.el.querySelectorAll('img').length === 0) {
                self.render();
                self.imagesReady = true;
                self.trigger('loaded');
            } else {
                var imgLoad  = new ImagesLoaded(this.el);
                imgLoad.on('always', function () {
                    self.render();
                    self.imagesReady = true;
                    self.trigger('loaded');
                });
            }
        },
        showHook: function (options) {},
        show: function () {
            this.el.style.display = "block";
            //this.el.offsetHeight;
            //this.el.classList.add('visible');
            this.showHook();
            return this;
        },
        render: function () {
            this.rendered = true;
            return this;
        },
        hideHook: function () {},
        hide: function () {
           // console.log('HIDE: '+ this.name)
            //this.el.classList.remove('visible');
            this.el.style.display = "none";
            this.hideHook();
            return this;
        }
    });
    return Page;
});
