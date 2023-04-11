function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}
function loadJS1(filename){ 
	var script = document.createElement("script");
    script.setAttribute.type = "text/javascript";
    script.src = filename;
    document.head.appendChild(script);
}
function loadJS2(filename){ 
	var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = filename;
    document.head.appendChild(script);
}
function loadJS3(filename){ 
	var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = filename;
    document.head.appendChild(script);
}
function loadJS4(filename){ 
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = filename;
    document.head.appendChild(script);
}


loadCSS("assets/carrousel/css/owl.carousel.min.css");
loadCSS("assets/carrousel/owl.theme.default.min.carousel.css");
loadJS1("assets/carrousel/js/main.carousel.js");
loadJS2("assets/carrousel/js/owl.carousel.min.js");
loadJS3("assets/carrousel/js/popper.carousel.js");
loadJS4("assets/carrousel/js/jquery.min.carousel.js");

