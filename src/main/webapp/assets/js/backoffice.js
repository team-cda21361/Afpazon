function loadCSS(filename){ 
    var file = document.createElement("link");
    file.setAttribute("rel", "stylesheet");
    file.setAttribute("type", "text/css");
    file.setAttribute("href", filename);
    document.head.appendChild(file);
}

loadCSS("./assets/css/backoffice.css");

$(document).ready( function () {
    $('.tableManager').DataTable({
        language: {
            url: "./assets/ajax/DataTables_Localization/fr-FR.json"
        },scrollY: '200px',
        scrollCollapse: true,
        paging: false,
        order:[[0,'desc']],
        columnDefs: [
           { orderable: false, targets: -1 },
           { orderable: false, targets: -2 }
        ]
    });
} );

console.log("coucou")
$('.toModal').click( function(){
	console.log("coucou2")
	var value = $(this).attr("href");
	console.log(value)
	var modal=document.querySelector("#modal");
	console.log(modal)
	modal.setAttribute("href",value);
})

/**************************** JS POUR STOCKMANAGEMENT *********************************/

$(".toModal").click(function(){
	
	recup = $(this).attr("href")
	console.log(recup+"aaaaa")
	modal = document.querySelector("#modal")
	console.log(modal+"bbbb")
	modal.setAttribute("href", recup)
	
})