
$(document).ready(function() {
  // Cibler le carousel et les boutons de navigation
  var carousel = $('.featured-carousel');
  var prevButton = $('.carousel-prev');
  var nextButton = $('.carousel-next');

  // Initialiser le carousel
  carousel.owlCarousel({
    loop: true,
    autoplay: true,
    margin: 30,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: false,
    dots: true,
    autoplayHoverPause: false,
    items: 1,
    navText : ["<span class='ion-ios-arrow-back'></span>","<span class='ion-ios-arrow-forward'></span>"],
    responsive:{
      0:{
        items:1
      },
      600:{
        items:2
      },
      1000:{
        items:3
      }
    }
  });

  // Ajouter un comportement de clic aux boutons de navigation
  prevButton.click(function() {
    carousel.trigger('prev.owl.carousel');
  });
  nextButton.click(function() {
    carousel.trigger('next.owl.carousel');
  });
});
	