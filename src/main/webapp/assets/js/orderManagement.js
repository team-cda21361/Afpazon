$(document).ready(function () {
    $('#example').DataTable({
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