/************************ TABLEAU ********************************/
$(document).ready( function () {
    $('#tableProduct').DataTable({
        language: {url: "./assets/ajax/DataTables_Localization/fr-FR.json"},
        scrollY: '100px',
        scrollCollapse: true,
        paging: false,
        /*order:[[0,'desc']],*/
        order:[[0,'desc'],[1,'desc'],[2,'desc'],[3,'desc']],
        /*columnDefs: [
			           { orderable: false, targets: -1 },
			           { orderable: false, targets: -2 },
			           { orderable: false, targets: -3 }
			        ],*/
    });
} );

