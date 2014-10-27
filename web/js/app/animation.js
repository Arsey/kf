define(['helper'], function (helper) {
    var images = [];
    var Tile = function (options) {
        this.init(options);
    }

    Tile.prototype = {
        init: function (options) {
            var self = this;
            if (!options.parent) {
                throw new Error('need to pass parentElement')
            }
            this.el = document.createElement('div');
            this.el.className = 'tileOverlay';
            this.currentImage = 0;
            this.rotator = options.rotator;
            this.el.addEventListener(helper.transEndEventName, function (event) {

            },false);
            options.parent.appendChild(this.el);
        },
        play: function (vector) {
            if (this.playing) {
                return false;
            }
            var drawer,
                self = this,
                callback, callbackEnd;

            if (vector === 1) {
                if (this.rotator.tiles[this.rotator.tiles.length-1] === this){
                    callback = this.rotator.hideCallback;
                    callbackEnd = this.rotator.endCallback;
                }
            } else {
                if (this.rotator.tiles[0] === this){
                    callback = this.rotator.showCallback;
                    callbackEnd = this.rotator.endCallback;
                }
            }
            this.playing = true;

            this.show();

            drawer = function () {
                // save
                self._request = requestAnimationFrame(drawer);

                // pass
                if (Date.now() - self.date  <26.6) {
                    return false;
                }
                self.date = Date.now();

                // stop
                if (self.currentImage === images.length || self.currentImage<0) {
                    cancelAnimationFrame(self._request);
                    self.playing = false;
                    self.hide();
                    if (typeof callbackEnd === 'function') {
                        callbackEnd(); // swap pages
                    }
                    return false;
                }

                self.el.style.backgroundImage = 'url('+images[self.currentImage].src+')';

                if(self.currentImage === 6) {
                    if (typeof callback === 'function') {
                        callback(); // swap pages
                    }
                }
                self.currentImage += vector;
            }
            drawer();
        },
        forward: function () {
            this.currentImage = 0;
            this.el.classList.add('fade');
            this.play(1);
        },
        backward: function () {
            this.currentImage = images.length - 1;
            this.el.classList.remove('fade');
            this.play(-1);
        },
        hide: function () {
            this.el.classList.add('hide');
            this.el.classList.remove('visible');
        },
        show: function () {
            this.el.classList.add('visible');
            this.el.classList.remove('hide');
        }
    };


    var SkyScreen = function (options) {
        this.init(options);
    };
    



    SkyScreen.prototype = {
        init: function (options) {
            var self = this;
            this.parent = options.parent;
            this.holder = this.parent.el.querySelector('.tiles');

            this.state = 1;
            this.tilesCount = 40;

            this.hideCallback = options.hideCallback;
            this.showCallback = options.showCallback;
            this.endCallback = options.endCallback;

            this.generateTiles();
            // cache images;
            this.preloadImages();
        },
        show: function (options) {
            this.state = -1;
            this.rotateAll(options);
        },
        hide: function (options) {
            this.state = 1;
            this.rotateAll(options);
        },
        preloadImages: function () {
            var x,
                path = '/img/squares/';
            for (x = 0; x <= 11; x++) {
                images.push(new Image());
                images[x].src = path + x + '.png'
                console.log(images[x])
            }
        },

        rotateAll: function () {
            var x,y,cur, 
                length = this.tiles.length, 
                video = this.video,
                size = this.tileSize, 
                proportion = this.videoProportion,
                self = this,
                counter;


            function cascade(index,vector) {
                var iteration, next;
                //console.log('cascade from '+ index);
                for (iteration = index; iteration >= 0; iteration--) {
                    next = 8 * index - (iteration*7);
                    if (!self.tiles[next]) {
                        return false;
                    }
                    self.tiles[next][(vector)?'forward':'backward']();
                }
            }

            clearTimeout(this.timer);
            
            if (this.state === 1) {
                counter = 0;
                while(counter!==-1){
                   // console.log(counter)
//                this.timer = setInterval(function () {
                    cascade(counter, true)
                    counter = (counter<7)?counter+1:counter+8;

                    if (counter >= self.tiles.length){
                        counter = -1;
//                        clearInterval(self.timer);
                    }
//                }, 0);
               }
            } else {
                counter = 39;
                while(counter!==-1){
//                this.timer = setInterval(function () {
                    cascade(counter, false)
                    counter = (counter<9)?counter-1:counter-8;

                    if (counter < 0){
                        counter = -1;
//                        clearInterval(this.timer);
                    }
//                }, 0);
                }
            }
        },

        generateTiles: function () {
            var self = this;
            var holder = document.querySelector('.subloading-pan');
            this.tiles = [];
            for (var x = 0; x < this.tilesCount; x++) {
                this.tiles.push(new Tile({parent: holder, rotator:this}));
            }
        }
    };
    
    return  SkyScreen;
});
