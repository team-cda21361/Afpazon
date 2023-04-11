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
console.log("coucou")
$('.toModal').click( function(){
	console.log("click");
	var btn =$(this).attr("href");
	var modal =document.querySelector("#modal")
	
	modal.setAttribute("href",btn);
	
})