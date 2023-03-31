function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
	var file2 = document.createElement("link");
	file2.setAttribute("rel", "stylesheet");
	file2.setAttribute("type", "text/css");
	file2.setAttribute("href", "./assets/plugins/DataTables/datatables.min.css");
	document.head.appendChild(file2);
}

loadCSS("./assets/css/account.css");

$(document).ready( function () {
    $('#ordersTable').DataTable({
        language: {
            url: "./assets/plugins/DataTables/fr-FR.json"
        },
        order:[[0,'desc']],
        columnDefs: [
		   { orderable: false, targets: -1 }
		]
    });
} );