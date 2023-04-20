function loadCSS(filename){ 
    var file = document.createElement("link");
    file.setAttribute("rel", "stylesheet");
    file.setAttribute("type", "text/css");
    file.setAttribute("href", filename);
    document.head.appendChild(file);
}

loadCSS("./assets/css/backoffice.css");


$(document).ready(function () {
    $('#orderDetails').DataTable({
        scrollY: '200px',
        scrollCollapse: true,
        paging: false,
    });
});

// delete orderProducts modal control
$('.toModal').click( function(){
	var value = $(this).attr("href");
	var modal=document.querySelector("#modal");
	modal.setAttribute("href",value);
})
// delete order modal control
$('#toModal').click( function(){
	var value = $(this).attr("href");
	var modal=document.querySelector("#modal");
	modal.setAttribute("href",value);
})