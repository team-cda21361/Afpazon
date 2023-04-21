function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/payment.css");

$(document).ready(function() {
    setTimeout(function() {
        $(".timer").fadeOut(1500);
    },5000);  
});

/*************************keep the page position when post datas***** */
   $(window).scroll(function () {
        let pageName = location.href.replaceAll('/','').replaceAll(':','');
        // console.log('scrolled ' + pageName);
        sessionStorage[pageName + '_scrollTop'] = $(this).scrollTop();
    });
$(document).ready(function () {
    let pageName = location.href.replaceAll('/','').replaceAll(':','');
    if (sessionStorage[pageName + '_scrollTop'] != "undefined") {
        // console.log('restored ' + pageName);
        $(window).scrollTop(sessionStorage[pageName + '_scrollTop']);
    }
});


document.querySelectorAll('.printbutton').forEach(function(element) {
    element.addEventListener('click', function() {
        print();
    });
});