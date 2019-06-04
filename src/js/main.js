$(document).ready(function () {

	// ChangeHrefBySelect
	ChangeHrefBySelect();

	// set chiều cao cho các block item tin tức
	SetHeightofNewsItem();

	/*  Header */
	Header_MoveLanguage();

	// Home
	Home();
	HomeBannerMobile();
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
	ProjectSlider2();

	// Career
	ApplyJob();

	// History
	GridItem();
})

$(window).on('resize', function () {
	SetHeightofNewsItem();
	HomeBannerMobile();
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
		$(this).find('.imgbox .home-6-imgbox').height($(this).width() / (275 / 380))
	})

	$('.manager-item').each(function () {
		$(this).find('.imgbox a').height($(this).width())
	})

	$('.career-news-item').each(function () {
		$(this).find('.imgbox a').height($(this).width() / (260 / 173))
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
				if ($('.home-banner .swiper-container .video-slide video').length > 0) {
					$('.home-banner .swiper-container .video-slide video')[0].addEventListener('ended', myHandler, false);
				}
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

	$('.home-6 .item [data-fancybox]').fancybox({
		toolbar: false,
		smallBtn: true,
		baseClass: 'map-popup',
	})

};
function HomeBannerMobile() {
	if ($(window).width() < 768) {
		$('.home-banner-2 .imgbox').height($(window).height() - $('header').height())
	} else {
		$('.home-banner-2 .imgbox').height(0)
	}
}
function Video() {
	const player = new Plyr(document.querySelectorAll('#video'));
}

function ProjectSlider1() {
	var ProjectSlider = new Swiper('.project-1 .project-list .swiper-container', {
		slidesPerView: 3,
		centeredSlides: true,
		spaceBetween: -600,
		loop: true,
		autoplay: {
			delay: 4500,
		},
		speed: 1200,
		// allowTouchMove: false,
		pagination: {
			el: '.project-1 .project-list .swiper-pagination',
			clickable: true,
		},
		on: {
			slideChange: function () {
				var activeIndex = this.activeIndex;
				var realIndex = this.slides.eq(activeIndex).attr('data-swiper-slide-index');
				$('.swiper-slide').removeClass('swiper-slide-nth-prev-2 swiper-slide-nth-next-2');
				$('.swiper-slide[data-swiper-slide-index="' + realIndex + '"]').prev().prev().addClass('swiper-slide-nth-prev-2');
				$('.swiper-slide[data-swiper-slide-index="' + realIndex + '"]').next().next().addClass('swiper-slide-nth-next-2');
			},
			init: function () {
				setTimeout(function () {
					$('.project-1 .project-list .swiper-container .swiper-slide .imgbox a').each(function () {
						$(this).height($(this).width() / (730 / 480))
					})
				}, 800)
			},
			resize: function () {
				setTimeout(function () {
					$('.project-1 .project-list .swiper-container .swiper-slide .imgbox a').each(function () {
						$(this).height($(this).width() / (730 / 480))
					})
				}, 800)
			}
		},
		breakpoints: {
			1024: {
				spaceBetween: 20,
			},
			768: {
				slidesPerView: 2,
				spaceBetween: 20,
			},
			576: {
				slidesPerView: 1.3,
				spaceBetween: 20,
			}
		}
	})
}

function ProjectSlider2() {
	var SmallProject = new Swiper('.small-project', {
		slidesPerView: 5,
		spaceBetween: 20,
		speed: 1200,
		loop: true,
		slideToClickedSlide: true,
		centeredSlides: true,
		loopedSlides: 5,
		breakpoints: {
			768: {
				slidesPerView: 3
			},
			576: {
				slidesPerView: 4,
				spaceBetween: 10,
			},
		},
		on: {
			init: function () {
				$('.small-project .swiper-slide a').each(function () {
					$(this).height($(this).width() / (730 / 480))
				})
			},
			resize: function () {
				$('.small-project .swiper-slide a').each(function () {
					$(this).height($(this).width() / (730 / 480))
				})
			}
		},
	})
	var BigProject = new Swiper('.big-project', {
		slidesPerView: 1,
		loopedSlides: 5,
		loop: true,
		speed: 1200,
		effect: 'fade',
		fadeEffect: {
			crossFade: true,
		},
		on: {
			init: function () {
				$('.big-project .swiper-slide a').each(function () {
					$(this).height($(this).width() / (730 / 480))
				})
			},
			resize: function () {
				$('.big-project .swiper-slide a').each(function () {
					$(this).height($(this).width() / (730 / 480))
				})
			}
		},
	})
	if ($('.small-project').length > 0) {
		BigProject.controller.control = SmallProject
		SmallProject.controller.control = BigProject
	}
}

function ApplyJob() {
	$('.career-detail .main-button').on('click', function (e) {
		e.preventDefault();
		$('.form-apply').slideToggle()
	})
}

function GridItem() {
	$('.grid').imagesLoaded(function () {
		// images have loaded
		$('.grid').masonry({
			// options
			itemSelector: '.grid-item',
			columnWidth: '.grid-sizer',
		});
	});
}