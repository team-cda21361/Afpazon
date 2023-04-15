function loadCSS(filename) {
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}
loadCSS("./assets/css/product.css");

$(document).ready(function() {
    setTimeout(function() {
        $(".timer").fadeOut(1500);
    },5000);  
});


/* Script utilice pour gestion de étoiles */ 
const rating = document.getElementById("startProm");

if(rating.value == undefined){
	rating.value = 0;
}
const starTotal = 5;
const starPercentage = (rating.value / starTotal) * 100;
const starPercentageRounded = (Math.round(starPercentage / 10) * 10);
if(starPercentageRounded > 0){
	document.querySelector(".stars-inner").style.width = starPercentageRounded + "%";	
	document.querySelector(".stars-outer").style.display="block";
}else{
	document.querySelector(".stars-outer").style.display="none";
}


/*****************************************/


/* Script utilice pour gestion de l'image */ 
const current = document.getElementById("current");
const opacity = 0.6;
const imgs = document.querySelectorAll(".img");
imgs.forEach(img => {
	img.addEventListener("click", (e) => {
		imgs.forEach(img => {
			img.style.opacity = 1;
		});
		current.src = e.target.src;
		e.target.style.opacity = opacity;
	});
});
/***************************************/

/*
var show_more = $("#show_more");
$(document).ready(function(){
    show_more.on('click',function(){
	
         var id_inmueble = $(this).attr('value');
         var dataString = 'idres=' + id_inmueble;     
 
 //       $('.show_more').hide();
 //       $('.loding').show();
        $.ajax({
            type:'POST',
            url:'product',
            data:dataString,
            success:function(html){

                //$('#show_more_main'+id_inmueble).remove();
                $('#list-Reviews').append(html);
                
            }
        });      
        
    });
});
*/

