function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}
loadCSS("./assets/css/slider.css");
loadCSS("./assets/css/swiper-bundle.min.css");

/*************************keep the page position when post datas***** */
   $(window).scroll(function () {
        let pageName = location.href.replaceAll('/','').replaceAll(':','');
         console.log('scrolled ' + pageName);
        sessionStorage[pageName + '_scrollTop'] = $(this).scrollTop();
    });
$(document).ready(function () {
    let pageName = location.href.replaceAll('/','').replaceAll(':','');
    if (sessionStorage[pageName + '_scrollTop'] != "undefined") {
        // console.log('restored ' + pageName);
        $(window).scrollTop(sessionStorage[pageName + '_scrollTop']);
    }
});


var swiper = new Swiper(".slide-container", {
  slidesPerView: 4,
  spaceBetween: 20,
  sliderPerGroup: 4,
  loop: true,
  centerSlide: "true",
  fade: "true",
  grabCursor: "true",
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
    dynamicBullets: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
    },


  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    520: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 3,
    },
    1000: {
      slidesPerView: 4,
    },
  },
});

// Get the modal
var modal = document.getElementById("myModal");
const imgs = document.querySelectorAll(".myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
imgs.forEach(img => {
    img.addEventListener("click", (e) => {
		modal.style.display = "block";
        modalImg.src = img.src;
        captionText.innerHTML = img.alt;
    });
});
var span = document.getElementsByClassName("close")[0];

span.onclick = function() { 
  modal.style.display = "none";
}

$(document).ready(function() {
    setTimeout(function() {
        $(".timer").fadeOut(1500);
    },5000);
});