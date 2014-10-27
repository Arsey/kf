/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Backbone, document, _, google, Swipe, $ */

define(['page', 'backbone'], function (Page, Backbone) {
    'use strict';
    var deferred = new $.Deferred();
    var gallery;

    var GalleryState = Backbone.Model.extend({
        url:function () {
            return 'http://skloresurs/uk/gallery/'+ gallery.collection.get(this.get('current')).id;
        },
        initialize: function () {
            this.on('change:current', this.setCurrentProject);
        },
        next: function () {
            console.log(this.get('current'))
            this.set('current', Math.min(this.get('current') + 1, gallery.collection.length));
        },
        prev: function () {
            this.set('current', Math.max(this.get('current') - 1, 1));
        },
        setCurrentProject: function () {
           this.fetch({
               success: function (model) {
                   model.trigger('projectLoaded');
               },
               error: function (model) {
                   console.log('error')
                   model.trigger('error');
               }
           })
        }
    });
    var GalleryCollection = Backbone.Collection.extend({
        url: function () {
            return 'http://skloresurs.apiary-mock.com/projects';
        },
        initialize: function () {
            this.fetch();
        }
    })

    var Gallery = Page.extend({
        events: {
            'click .left-arrow': function () {
                this.swipe.prev();
            },
            'click .right-arrow': function () {
                this.swipe.next();
            },
            'click .close': function () {
                this.el.classList.remove('show');
                //this.fixedThumb.classList.remove('fix');
            },
            'click .thumb': function (event) {
                this.fixedThumb = event.currentTarget;
                _.each(this.fixedThumb.parentElement.children, function (el, index) { // slide to clicked thumb
                    if (this.fixedThumb === el) {
                        this.swipe.slide(index, 0);
                    }
                }, this);
                //this.fixedThumb.classList.add('fix');
                this.el.classList.add('show'); // show gallery
            },
            'click .prev-project': function () {
                this.state.prev();
            },
            'click .next-project': function () {
                this.state.next();
            }
        },
        name: 'gallery',
        promise: deferred,
        initHook: function () {
            var self = this;

            this.collection = new GalleryCollection(); // get all project (for counter and nav)
            this.state = new GalleryState({current:1}); // curent navigation state and current project attributes

            // update pagination
            this.listenTo(this.collection, "add", function () {
                this.el.querySelector('.project-navigation .total').innerHTML = this.collection.length;
            });

            //update current project number
            this.listenTo(this.state, "change:current", function () {
                this.el.querySelector('.project-navigation .current').innerHTML = this.state.get('current');
            });

            //change projects
            this.listenTo(this.state, 'projectLoaded', this.changeProjects);

            // init gallery
            this.gallery = this.gallery|| this.el.querySelector('.full-gallery');
            this.sliderHolder = this.sliderHolder || this.el.querySelector('.swipe');

            this.swipe = new Swipe(this.sliderHolder, {
                // show hide arrows at borders
                transitionEnd: function (index) {
                    if (index + 1 === self.el.querySelectorAll('.slide').length) {
                        self.el.classList.add('last');
                    } else {
                        self.el.classList.remove('last');
                    }
                    if (index === 0) {
                        self.el.classList.add('first');
                    } else {
                        self.el.classList.remove('first');
                    }
                }
            });

        },
        changeProjects:function () {
            var renderDesc = (function renderDesc(elem) {
                var desc = elem.querySelector('.description').cloneNode(true);
                return function (data) {
                    var newDesc = desc.cloneNode(true);
                    Array.prototype.forEach.call(newDesc.querySelectorAll('.title,.location,.date,.glass'), function (el, index) {
                        el.innerHTML = data[index];
                    });
                    return newDesc;
                }
            }(this.el));
            var self = this;
            var newData = this.state.attributes;

            this.el.classList.add('change-project'); // start animation

            // render new description
            var newDesc = renderDesc([
                newData.name,
                newData.city,
                newData.year,
                newData.description
            ]);
            this.el.querySelector('.description-holder').appendChild(newDesc); // insert new description
            newDesc.offsetHeight; // force redraw
            newDesc.classList.add('new'); // animate new description

            // insert new images
            _.forEach(this.el.querySelectorAll('.thumb'), function (el, index) {
                var image = new Image();
                image.src = 'http://skloresurs/resize.php?w=780&h=780&src=uploads/gallery/'+_.values(newData.photos)[index];
                el.appendChild(image);
                image.offsetHeight;
                image.classList.add('new');
            });

            //updateGallery
            var slides = this.el.querySelector('.swipe-wrap');
            slides.innerHTML = ''; // remove old slides
            _.forEach(newData.photos, function (el, index) {
                var image = new Image(),
                    slide = document.createElement('div');
                slide.className = 'slide';
                image.src = 'http://skloresurs/resize.php?w=780&h=780&src=uploads/gallery/'+el;
                slide.appendChild(image);
                slides.appendChild(slide);
            });
            this.swipe.setup(); // reinit gallery

            // normalize html after change
            // TODO: replace timer with callback of transitino end
            setTimeout(function () {
                self.el.classList.remove('change-project');
                var description = self.el.querySelectorAll('.description');
                //                    description[0].parentElement.removeChild(description[0]);
                Array.prototype.forEach.call(self.el.querySelectorAll('.new'), function (el) {
                    el.parentElement.removeChild(el.parentElement.children[0])
                    el.classList.remove('new');
                });
            }, 1000);
        },
        showHook: function () {
            //reinit galleyr after show, because when gallery hidden it calculate size incorrectly
            this.swipe.setup();
        }
    });

    gallery = new Gallery();
    return deferred;
});
