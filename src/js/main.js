$(document).ready(function () {

	// ChangeHrefBySelect
	ChangeHrefBySelect();

	// set chiều cao cho các block item tin tức
	SetHeightofNewsItem();

	/*  Header */
	Header_MoveLanguage();

	// Home
	Home();

	// Chạy script AOS khi mấy cái khác chạy xong
	AOS.init({
		duration: 1200,
		once: true,
		disable: 'phone',
		offset: 400,
	});

	// Safety
	Video();

	// project
	ProjectSlider1();
})

$(window).on('resize', function () {
	SetHeightofNewsItem();
})

function ChangeHrefBySelect() {
	$('[data-nav]').on('change', function () {
		var selectHref = $(this).val();
		if (selectHref.length > 0) {
			window.location.assign(selectHref);
		}
	})
}

function SetHeightofNewsItem() {

	$('.project-item').each(function () {
		if ($(this).hasClass('big')) {
			$(this).find('.imgbox a').height($(this).width() / (540 / 360))
		} else {
			$(this).find('.imgbox a').height($(this).width() / (350 / 230))
		}
	})

	$('.home-6 .item').each(function () {
		$(this).find('.imgbox a').height($(this).width() / (275 / 380))
	})

	$('.manager-item').each(function () {
		$(this).find('.imgbox a').height($(this).width())
	})
};



function Header_MoveLanguage() {

	var language = new MappingListener({
		selector: 'header .language',
		desktopWrapper: 'header .menu-wrapper',
		desktopMethod: 'appendTo',
		mobileWrapper: 'header .toggle-button',
		mobileMethod: 'insertBefore',
		breakpoint: 1025,
	}).watch()

	$('header .search-toggle').on('click', function () {
		$('header .searchbox').toggleClass('show')
	})

	$('header .searchbox input').on('blur', function () {
		$('header .searchbox').removeClass('show')
	})

	$('header .toggle-button').on('click', function () {
		$('header .menu-wrapper').toggleClass('show')
		if ($('header .menu-wrapper').hasClass('show')) {
			$('body').addClass('hide')
		} else {
			$('body').removeClass('hide')
		}
	})

};


function Home() {

	$('.home-banner .scroll-down').on('click', function () {
		$('html,body').animate({
			scrollTop: $('.home-1').offset().top - 80
		}, 1000)
	})

	function myHandler(e) {
		$('.home-banner .swiper-next-button').trigger('click');
		setInterval(function () {
			$('.home-banner .swiper-next-button').trigger('click');
		}, 5000)
	}

	var swiper = new Swiper('.home-banner .swiper-container', {
		speed: 1000,
		loop: true,
		lazy: true,
		allowTouchMove: true,
		navigation: {
			nextEl: '.home-banner .swiper-next-button',
			prevEl: '.home-banner .swiper-prev-button',
		},
		on: {
			init: function () {
				if ($(window).width() >= 1025) {
					$('.home-banner .swiper-container .swiper-slide').height($(window).outerHeight() - 80)
				}
				$('.home-banner .swiper-container .video-slide video')[0].addEventListener('ended', myHandler, false);
			}
		}
	})

	var vid = $('.home-banner .swiper-slide video')
	swiper.on('slideChange', function () {
		if (swiper.activeIndex == 0) {
			vid.get(0).play()
		} else {
			vid.get(0).pause()
		}
	});
	$('.home-6 .item').each(function () {
		$(this).find('.imgbox a').height($(this).width() / (275 / 380))
	})

	$('.home-6 a[data-fancybox]').fancybox({
		toolbar: false,
		smallBtn: true,
		iframe: {
			preload: false
		}
	})

};

function Video() {
	const player = new Plyr(document.querySelectorAll('#video'));
}

function ProjectSlider1() {
	var ProjectSlider = new Swiper('.project-1 .swiper-container', {
		slidesPerView: 5,
		centeredSlides: true,
		loop: true,
	})
}