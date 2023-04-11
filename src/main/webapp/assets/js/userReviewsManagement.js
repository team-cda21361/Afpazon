function loadCSS(filename){ 
    var file = document.createElement("link");
    file.setAttribute("rel", "stylesheet");
    file.setAttribute("type", "text/css");
    file.setAttribute("href", filename);
    document.head.appendChild(file);
}

loadCSS("./assets/css/backoffice.css");

$(document).ready(function () {
    $('#example').DataTable({
		 language: {
            url: "./assets/ajax/DataTables_Localization/fr-FR.json"
        },
        scrollY: '200px',
        scrollCollapse: true,
        paging: false,
         order:[[1,'desc']],
        columnDefs: [
           { orderable: false, targets: -1 },
           { orderable: false, targets: -2 }
        ]
    });
});

$('.toModal').click( function(){
	
	var value =$(this).attr("href");
	var modal =document.querySelector("#modal")
	
	modal.setAttribute("href",value);
	
})