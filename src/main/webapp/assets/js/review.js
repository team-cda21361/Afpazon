function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/review.css");

$(document).ready(function() {
    $(".messageToUser").slideDown();
    setActiveNav();
});

const timeout = setTimeout(hideMessage, 5000);

function hideMessage() {
	$(".messageToUser").slideUp();
}