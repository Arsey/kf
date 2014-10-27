/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google */

define(["preloader", "backbone", "jquery", 'page', 'mustache', 'text!../../templates/partials/posts-single.html'], function (preloader, Backbone, $, Page, Mustache, Template) {
    'use strict'
    var deferred = new $.Deferred();
    
    var PageModel = Backbone.Model.extend({
        url: function () {
            return 'http://skloresurs/uk/post/news1'
        }
    });

    var Posts = Page.extend({
        promise: deferred,
        renderTemplate: function () {
            this.setElement(Mustache.render(Template, this.model.attributes));
        },
        initialize: function (options) {
            preloader.push(this.name);
        
            this.model = new PageModel([], {view: this});
            this.state  = new Backbone.Model();
            this.listenTo(this.model, "change", this.render);
            
            this.on('loaded', function () {
                this.promise.resolve(this);
                preloader.done(this.name);
            })
            this.initHook();
            this.preparePage();
        },
        render: function () {
            this.renderTemplate();
            if (this.el.parentElement) {
                this.el.parentElement.removeChild(this.el);
            }
            document.body.appendChild(this.el);
            this.rendered = true;
        },
        load: function (slug) {
            preloader.push(slug);
            this.state.set("slug", slug);
            this.fetchPage();
        },
        fetchPage: function () {
            var self = this;
            this.model.clear({silent:true}).fetch({
                success: function () {
                    preloader.done(self.state.get('slug'));
                    preloader.subloading(self);
                }
            });
        }
    });
    new Posts();
    return deferred.promise();
});
