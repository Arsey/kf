/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, window, _ */

define(['backbone', 'helper', 'animation'], function (Backbone, Helper, Animation) {
    'use strict';
     
    var Preloader = function () {
        var self = this;
        this.el = document.getElementById('preloader');
        this.loaded = false;
        this.toLoad = [];
        this.documentLoaded = false;
        this.duration = 1.5;
        this.el.parentNode.classList.add('dom-loaded');
        this.timeStamp = new Date();
        this.dispatcher = _.clone(Backbone.Events);

        this.animation = new Animation({
            parent: this,
            hideCallback: function () {
                self.prevPage.hide();
                self.currentPage.el.style.zIndex = '';
                self.animation.sky.style.zIndex = '-2';
                self.animation.video.pause();
            },
            showCallback: function () {
                console.log('hot')
                self.prevPage.hide();
                self.currentPage.el.style.zIndex = '';
                self.animation.sky.style.zIndex = '';
                self.animation.video.play();
            },
            endCallback: function () {
                self.prevPage.el.classList.remove('prevPage');
                self.currentPage.el.classList.remove('nextPage');
                document.body.classList.remove('subloading-state');
                self.el.style.display = 'none';
                console.log('this si the end')
            }
        });


        this.animation.video = document.querySelector('#video-clouds');
        this.animation.sky = document.querySelector('.sky');


        this.init();
    };
    
    Preloader.prototype = {
        log : function (str) {
            console.log('preloader: ' + str);
        },
        init : function () {
            console.log('init');

//            this.dispatcher.on('loaded', function () {
//                this.loaded = true;
//                if (!this.subloadingState) {
//                    setTimeout(function () {
//                        this.el.style.display = "none";
//                    }.bind(this), 1000);
//                }
//            }.bind(this));

            if (document.readyState === "complete") {
                this.documentLoaded = true;
                this.log('dom loaded before');
                this.test();
            } else {
                window.addEventListener('load', function () {
                    this.documentLoaded = true;
                    this.log('dom loaded');
                    this.test();
                }.bind(this), false);
            }
        },
        // check if all modules are loaded
        checkLoadingState : function () {
            if (this.toLoad.length === 0) {
                return true;
            }
            return this.toLoad.every(function (el) {
                return el.state;
            });
        },
        push : function (name) {
            this.toLoad.push({
                name: name,
                state: false
            });
            this.log('added ' + name);
        },
        done : function (name) {
            console.log(this.toLoad);
            this.toLoad.forEach(function (el, index, arr) {
                if (el.name === name) {
                    _.each(arr, function (el) {
                        console.log(el);
                    });
                    arr.splice(index, 1);
                    this.log('done ' + name);
                    console.log(arr);
                }
            }, this);
            this.test();
        },
        subloading : function (page) {
            var self = this;
            if (!this.currentPage) { // initial loading of firstpage
                this.currentPage = page;
                //this.animation.sky.style.zIndex = 0;
                page.show();
                console.log('initial loading of firstpage')
                if (page.name === 'homepage') {
                    this.animation.video.play();
                }
            } else {
                
                
                //this.animation.sky.style.zIndex = '';
                this.prevPage = this.currentPage;
                this.currentPage = page;
                
                this.currentPage.el.style.zIndex = '-1';
                this.currentPage.show();
                
                this.prevPage.el.classList.add('prevPage');
                this.currentPage.el.classList.add('nextPage');
                
                
                this.el.style.display = 'block';
                document.body.classList.add('subloading-state');
                
                if(this.prevPage.name === 'homepage'){ // homepage exit animation
                    this.animation.hide();
                    this.currentPage.show();
                } else {
                    if (this.currentPage.name === 'homepage') { // menu in animation
                        this.animation.show();
                    } else { // page to page animation
                       this.animation.show();
                    }
                }
            }
        },
        hide : function () {
            // hide
            var self = this;
            this.el.addEventListener(Helper.transEndEventName, function remover(event) {
                if (event.propertyName.indexOf('z-index') === -1) {
                    return;
                }
                self.el.style.display = "none";
                self.el.removeEventListener(Helper.transEndEventName, remover, false);
            }, false);
            // fade
            if (this.timeStamp  - new Date() < this.duration * -1000) {
                this.log(['in time', (this.timeStamp  - new Date())]);
                document.documentElement.classList.add('loaded');
                this.dispatcher.trigger('loaded');
            } else {
                this.log(['need to wait', (this.duration * 1000 - (this.timeStamp  - new Date()))]);
                setTimeout(function () {
                    document.documentElement.classList.add('loaded');
                    this.dispatcher.trigger('loaded');
                }.bind(this), (this.duration * 1000 - (this.timeStamp  - new Date())));
            }

        },

        // test if all modules are loaded and hide if so
        test : function () {
            if (this.checkLoadingState() && this.documentLoaded) {
                this.hide();
            } else {
                console.log(this.checkLoadingState(), this.documentLoaded, this.toLoad);
            }
        }
    };
    
    
    return new Preloader();
});
