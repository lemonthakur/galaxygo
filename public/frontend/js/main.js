/*===============================================

Theme Name:3D Print HTML Template
Version:1.0
Author: ITCLAN
Support: itclan@gmail.com
Description: 3D Print HTML Template

NOTE:
=====
Please DO NOT EDIT THIS JS, you may need to use "custom.js".

===============================================**/


(function($) {
    "use strict";


    /*========================================
        Preloader
    ========================================*/

    $(window).on('load', function() {
        $("#loading").fadeOut(500);

    });


    /*========================================
        Scroll  top
    ========================================*/

    var scrollTop = $('.ic-scroll-top');
    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            scrollTop.css({
                'bottom': '10%',
                'opacity': '1',
                'transition': 'all .5s ease-in-out'
            });
        } else {
            scrollTop.css({
                'bottom': '-15%',
                'opacity': '0',
                'transition': 'all .5s ease-in-out'
            })
        }
    });
    scrollTop.on('click', function() {
        $('html, body').animate({
            scrollTop: 0
        }, 1000);
        return false;
    });


    /*=====================================
       Sticky Menu
=========================================*/

    //     var icWindow=$(window);

    //     icWindow.on('scroll', function () {
    // 	var icScroll = icWindow.scrollTop();
    // 	if (icScroll < 150) {
    // 		$("#ic-sticky-header").removeClass("ic-sticky");
    // 	} else {
    // 		$("#ic-sticky-header").addClass("ic-sticky");
    // 	}
    // });


    /*========================================
        Ic Mobile menu activation
    ========================================*/

    $('.ic-mobile-menu-open,.ic-mobile-menu-overlay').on('click', function() {
        $('.ic-mobile-menu-wrapper,.ic-mobile-menu-overlay').addClass('active')
    });
    $('.ic-menu-close,.ic-mobile-menu-overlay').on('click', function() {
        $('.ic-mobile-menu-wrapper,.ic-mobile-menu-overlay').removeClass('active')
    });

    /*========================================
        Ic Mobile Menu Toggle
    ========================================*/

    var $icMobileNav = $('.ic-mobile-menu'),
        $icMobileSubMenuNav = $icMobileNav.find('.ic_sub_menu');
    $icMobileSubMenuNav.parent().prepend('<span class="menu-expand"> <i class="icofont-simple-down"></i></span>');
    $icMobileSubMenuNav.slideUp();
    $icMobileNav.on('click', 'li a, li .menu-expand', function(e) {
        var $this = $(this);
        if (($this.parent().attr('class').match(/\b(ic-menu-item-has-children|has-children|has-ic_sub_menu)\b/)) && ($this.attr('href') === '#' || $this.hasClass('menu-expand'))) {
            e.preventDefault();
            if ($this.siblings('ul:visible').length) {
                $this.siblings('ul').slideUp('slow');
            } else {
                $this.closest('li').siblings('li').find('ul:visible').slideUp('slow');
                $this.siblings('ul').slideDown('slow');
            }
        }
        if ($this.is('a') || $this.is('span') || $this.attr('clas').match(/\b(menu-expand)\b/)) {
            $this.parent().toggleClass('menu-open');
        } else if ($this.is('li') && $this.attr('class').match(/\b('ic-menu-item-has-children')\b/)) {
            $this.toggleClass('menu-open');
        }
    });


    $('.login-input').focus(function() {
        $(this).parent().addClass('icon-color');
    })

    /*========================================
     Product Banner 
     ========================================*/


    $('.ic-product-banner').owlCarousel({
        items: 1,
        autoplay: 3000,
        loop: true,
        smartSpeed: 2000,
        margin: 30,
        nav: false,
        dots: true,

    });


    /*========================================
       Active 
       ========================================*/

    $('.ic-active-link').on('click', function() {
        $('.ic-active-link').removeClass('active');
        $(this).addClass('active');

    })

    /*========================================
         Quantity 
         ========================================*/

    $('.qty-plus').on('click', function() {
        $(this).prev().val(+$(this).prev().val() + 1);
    })

    $('.qty-minus').on('click', function() {
        if ($(this).next().val() > 0) {
            $(this).next().val(+$(this).next().val() - 1);
        }
    })


    var $easyzoom = $('.easyzoom').easyZoom();

    // /*========================================
    //  Customer Review Slider
    //  ========================================*/

    $('.ic-happy-client-carousel').owlCarousel({
        autoplay: 2000,
        loop: true,
        smartSpeed: 1500,
        margin: 30,
        nav: true,
        dots: false,

        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            800: {
                items: 2
            },
            992: {
                items: 4
            }
        }
    });













})(jQuery);