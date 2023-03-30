function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/account.css");