$(document).ready(function() {
    var transEndEventNames = {
        'WebkitTransition': 'webkitTransitionEnd', // Saf 6, Android Browser
        'MozTransition': 'transitionend', // only for FF < 15
        'transition': 'transitionend'       // IE10, Opera, Chrome, FF 15+, Saf 7+
    }
    , transformEventName = Modernizr.prefixed('transform')
            , transEventName = Modernizr.prefixed('transition')
            , transEndEventName = transEndEventNames[ transEventName ];
// identify browser 
    if (navigator.userAgent.match(/(iPad|iPhone|iPod)/g)) {
        document.documentElement.classList.add('ios')
    }
    ;
    if (navigator.userAgent.match(/Android/i)) {
        document.documentElement.classList.add('android')
    }
    ;
    if (document.all && document.querySelector && !document.addEventListener) {
        document.documentElement.classList.add('ie8')
    }
    ;

// fadeIn page (load or DOMContentLoaded);
    window.addEventListener && window.addEventListener('load', function() {
        document.body.className += ' loaded';
    });

//Scroll top button ------------------
    $("a[href='#top']").click(function() {
        $("html, body").animate({scrollTop: 0}, "slow");
        return false;
    });

//Custom select box ------------------
    $(".custom-select").each(function() {
        $(this).wrap("<span class='select-wrapper'></span>");
        $(this).after("<span class='holder'></span>");
    });
    $(".custom-select").change(function() {
        var selectedOption = $(this).find(":selected").text();
        $(this).next(".holder").text(selectedOption);
    }).trigger('change');

//Price table calculate footer width ------------------
    var count = $(".table-data-box .price-data-column").length;
    var foterTableWidth = (count * 100) + 200;
    $('.table-footer').css('width', foterTableWidth);

//tooltip in programs list ------------------
    $(".not-exist").on({
        mouseenter: function() {
            var popupHtml = $('.no-program-exist-popup').clone();
            $(this).append(popupHtml);
        },
        mouseleave: function() {
            $('.list-block .no-program-exist-popup').remove();
        }
    });
//Show menu ------------------
    $(document).click(function(event) {
        if (!$(event.target).closest('#menu-popup').length) {
            if ($('#menu-popup').is(":visible")) {
                $('#menu-popup').hide();
            }
        }
        if (event.target.id === 'trigger') {
            if ($('#menu-popup').is(":hidden")) {
                $('#menu-popup').show();
            } else {
                $('#menu-popup').hide();
            }
        }
        if (event.target.nodeName === 'A') {
            $('#menu-popup').hide();
        }
        if (!($(event.target).hasClass("slideMenu") || $(event.target).parents().hasClass("slideMenu") || event.target.id === 'clubs')) {
            $('.clubs-list-menu').animate({
                height: "0"
            }, 1000);
        }
    });

//TODO: finish when data fromf server ------------------
    $('#menu-popup .list-block a').click(function(event) {
        event.preventDefault();
    });

//ToDo: скрип який буде брати текст і підставляти в тел алт для того щоб при хувері бачити повний текст поля яке не вмістилось
//$('#club-rozklad-table .table-row div').text();


//Home page Header section popups menus triggers ------------------
    var animationMenu = function(target, container, speed) {
        $(target).click(function() {
            $(container).animate({
                height: "352px"
            }, speed);
        });
    };
    animationMenu('#clubs', '.clubs-list-menu', 500);
    var closeMenuBtn = function(target) {
        $('.icon-closed').click(function() {
            $(target).animate({height: 0}, 500);
            $(target).removeClass('open');
        });
    };
    closeMenuBtn('.clubs-list-menu');


//Home page menu triggers ------------------
    var windowHeight = $(window).height();
    var menuHeight = $('.menu-box').outerHeight();
    var menuContainerHeight = $('.services-menu-container').outerHeight();
    var translateString;
    if ($('body').hasClass('home')) {
        translateString = 'translate(0, -' + menuHeight + 'px)';
    } 
    //Start
    $('.services-menu-container').css('top', windowHeight);
    $('.services-menu-container').css({
        "-webkit-transform": translateString,
        "-ms-transform": translateString,
        "transform": translateString
    });
    //Open
    $('.menu-box a').click(function() {
        $('.menu-box a').removeClass('active-icona');
        $(this).addClass('active-icona');
        $('.services-menu-container').addClass('open');
        if ($('body').hasClass('home')) {
            $('.services-menu-container').animate({
                top: menuHeight
            }, 800);
        }
    });
    $('.service-trigger').click(function() {
        $('.services-menu-container').addClass('open');
        $('.tabs a[href$="#panel1"]').addClass('active-icona');
        $('.services-menu-container').animate({
            top: 0
        }, 800);
    });

    //Close
    $('.services-menu-container .trigger').click(function() {
        $('.menu-box a').removeClass('active-icona');
        $('.services-menu-container').removeClass('open');
        $('.services-menu-container').animate({
            top: windowHeight
        }, 1000);
    });










//Swipe Emulation -------------------
    $('.rozklad-table').mousedown(function(event) {
        var startPositionOffset = $(this).parent().offset();
        var startPosition = (event.pageX - startPositionOffset.left);
        var currentposition = $(this).scrollLeft();
        $(this).mousemove(function(e) {
            var parentOffset = $(this).parent().offset();
            var relativeXPosition = (e.pageX - parentOffset.left);
            var scrollPosition = startPosition - relativeXPosition;
            if (scrollPosition > 0) {
                var sym = currentposition + scrollPosition;
                $(this).scrollLeft(sym);
            } else {
                var sym = currentposition + scrollPosition;
                $(this).scrollLeft(sym);
            }
        });
    }).mouseup(function() {
        $(this).unbind('mousemove');
    }).mouseleave(function() {
        $(this).unbind('mousemove');
    });

//Club Pages menus trigger -------------------
    $('.icons-menu .icon-photo, \n\
       .icons-menu .icon-video, \n\
       .icons-menu .icon-map, \n\
       .icons-menu .icon-virtual').click(function(event) {
        $("html, body").animate({scrollTop: 0}, "slow");
        if ($(event.target).hasClass("icon-photo")) {
            $('.photo-gallery').addClass('open');
        } else if ($(event.target).hasClass("icon-video")) {
            $('.video-container').addClass('open');
        } else if ($(event.target).hasClass("icon-map")) {
            $('.map-container').addClass('open');
            initializeMap();
        } else if ($(event.target).hasClass("icon-virtual")) {
            $('.virtual-container').addClass('open');
        }
    });
    $('.slide-container .icon-closed').click(function(event) {
        $(this).closest('.slide-container').removeClass('open');
    });

//Video iframes fluid ----------------------
    $(function() {
        var $allVideos = $("iframe[src^='http://player.vimeo.com'], iframe[src^='//www.youtube.com'], object, embed, iframe");
        var $fluidEl = $("figure");
        $allVideos.each(function() {
            $(this).attr('data-aspectRatio', this.height / this.width).removeAttr('height').removeAttr('width');
        });
        $(window).resize(function() {
            var newWidth = $fluidEl.width();
            $allVideos.each(function() {
                var $el = $(this);
                $el.width(newWidth).height(newWidth * $el.attr('data-aspectRatio'));
            });
        }).resize();
    });













});