/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, $ */

define(['page', 'backbone', 'mustache', 'jquery', 'helper'], function (Page, Backbone, Mustache, $, helper) {
    'use strict';
    var videoFormats = ["webm", "mp4"];
    var hintTemplate ='<div class="hint remove left-{{pos.x}} top-{{pos.y}}"><div class="message"><div class="title">{{title}}</div><p class="text">{{text}}</p></div></div>';
    var data = [
        {
            video: '/pictures/filename',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/sky',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/filename',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/sky',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/filename',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/sky',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/filename',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/sky',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/filename',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        },
        {
            video: '/pictures/sky',
            hints: [
                {
                    title: "lore1",
                    text: "lore1",
                    pos:{
                        x:5,
                        y:2
                    }
                },
                {
                    title: "lore2",
                    text: "lore2",
                    pos:{
                        x:3,
                        y:4
                    }
                },
                {
                    title: "lore3",
                    text: "lore3",
                    pos:{
                        x:2,
                        y:3
                    }
                }
            ]
        }
    ];
    var deferred = new $.Deferred();

    var State = Backbone.Model.extend({
        initialize: function () {
            this.on('change:current', this.setCurrentVideo);
        },
        next: function () {
            this.set('current', Math.min(this.get('current') + 1, this.get('total')));
        },
        prev: function () {
            this.set('current', Math.max(this.get('current') - 1, 0));
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

    var Production = Page.extend({
        name: 'production',
        promise: deferred,
        events: {
            'click .step': function (event) {
                var current;
                this.steps.forEach(function (el, index) {
                    if (el === event.currentTarget) {
                        current = index;
                    }
                });
                this.state.set('current', current);
            },
            'click .hint': function (event) {
                if (event.currentTarget.classList.contains('active')) {
                    event.currentTarget.classList.remove('active');
                    return false;
                }
                this.hints.forEach(function (el) {
                     el.classList.remove('active');
                });
                event.currentTarget.classList.add('active');
            }

        },
        initHook: function () {
            this.state = new State({current: 1, total: 10});
            this.listenTo(this.state, 'change:current', this.highlight);
            this.listenTo(this.state, 'change:current', this.changeStep);
            
            this.steps = Array.prototype.slice.call(this.el.querySelectorAll('.step'));
            this.hints = Array.prototype.slice.call(this.el.querySelectorAll('.hint'));
            this.videos = Array.prototype.slice.call(this.el.querySelectorAll('video'));
        },
        highlight: function () {
            var current = this.state.get('current');
            this.steps.forEach(function (el, index) {
                if (index < current) {
                    el.classList.add('active');
                    el.classList.remove('last');
                } else if (index == current) {
                    el.classList.add('active', 'last');
                } else{
                    el.classList.remove('active', 'last');
                }
            });
        },
        renderVideoSources: function (src) {
            var sources = '';
            videoFormats.forEach( function (el) {
                sources+= '<source src="'+src+'.'+el+'" type="video/'+el+'"></source>';
            });
            return sources;
        },
        renderHint: function (hint) {
            return $(Mustache.render(hintTemplate, hint)).get(0);
        },
        
        
        
        changeStep: function () {
            // get step data
            var step = data[this.state.get('current')];
            var self = this;

            this.videos.forEach(function (el, index) {
                //show video on play
                el.addEventListener('play', function (event) {
                    event.target.classList.remove('remove');
                }, false);

                //hide video
                el.addEventListener(helper.transEndEventName, function handler(event) {
                    el.removeEventListener(helper.transEndEventName, handler, false);
                    //stop video
                    //var video = el.querySelector('video');
                    this.pause();
                    //change video
                    this.innerHTML = self.renderVideoSources(step.video);
                    //play video
                    //show video
                    this.load();
                    this.play();
                }, false);
                el.classList.add('remove');
            });

            var hints = this.el.querySelectorAll('.hint');
            if (hints.length === 0) {
                this.insertNewHints();    
            } else {
                _.each(hints, function (el) {
                    el.addEventListener(helper.transEndEventName, function handler(event) {
                        // TODO: refactor this
                        //remove hints
                        //render hints
                        //appedn hints
                        //show hints
                        self.insertNewHints();
                    }, false);
                    //close hints
                    //hide hints
                    el.classList.add('remove');
                });
            }
        },
        insertNewHints: function () {
             var hintsHolder = this.el.querySelector('.hints');
            //remove hints
            hintsHolder.innerHTML = '';
            
            if(!data[this.state.get('current')]) { // erorr handling
                return false;
            }
            data[this.state.get('current')].hints.forEach(function (el) {
                //render hints
                var newHint = this.renderHint(el);
                //appedn hints
                hintsHolder.appendChild(newHint);
                newHint.offsetHeight;
                //show hints
                newHint.classList.remove('remove');
            },this);
        }

    });
    var production = new Production();
    return deferred.promise();
});
