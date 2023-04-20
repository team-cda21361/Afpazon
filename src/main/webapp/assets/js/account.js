function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/account.css");

$(document).ready( function () {
    $('#ordersTable').DataTable({
        language: {
            url: "./assets/ajax/DataTables_Localization/fr-FR.json"
        },
        order:[[0,'desc']],
        columnDefs: [
		   { orderable: false, targets: -1 }
		]
    });
} );

$(document).ready(function() {
    $(".messageToUser").slideDown();
    setActiveNav();
});

const timeout = setTimeout(hideMessage, 5000);

function hideMessage() {
	$(".messageToUser").slideUp();
}