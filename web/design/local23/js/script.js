

// header slider
var slides=	$('div', '#slider');
var length= slides.length - 1
setInterval(
	function() {
		var active= slides.filter('.active');
		var activeIndex= slides.index(active);
		var nextIndex= (activeIndex == length)?0:activeIndex+1;
		var next=slides.eq(nextIndex);

		next.css('z-index', '1').addClass('active');
		console.log(activeIndex,nextIndex,length)
		setTimeout (
			function() {
				active.removeClass('active')
				next.css('z-index','')
			},
			4000)
	},
	8000)




$(document).ready(function(){

	// adress
	$('.knopa').on('click',function(e) {
		$('li').toggleClass('ouup')
	});

	// mobi menu
	$('.main_nav_header > li > a').on('touchstart',function(e) {
		if ( $(window).width() < 769 ) {
			$(this).next('ul').toggleClass('active');
		};
	});

});



$('.content_table .more_person').on('click',function(e){
	$(this).parent().toggleClass('active');
});





// $('.main_nav_header > li ul > li').hover(function() {
// 	$(this).toggleClass('after_hover');
// });