function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/payment.css");

$(document).ready(function() {
    setTimeout(function() {
        $(".timer").fadeOut(1500);
    },5000);  
});
/*************************keep the page position when post datas***** */
   $(window).scroll(function () {
        let pageName = location.href.replaceAll('/','').replaceAll(':','');
        // console.log('scrolled ' + pageName);
        sessionStorage[pageName + '_scrollTop'] = $(this).scrollTop();
    });
$(document).ready(function () {
    let pageName = location.href.replaceAll('/','').replaceAll(':','');
    if (sessionStorage[pageName + '_scrollTop'] != "undefined") {
        // console.log('restored ' + pageName);
        $(window).scrollTop(sessionStorage[pageName + '_scrollTop']);
    }
});


/*************Validation Payment****************/
var regexTelephone = new RegExp(/^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$/);
var regexCodPostal = new RegExp(/^(?:0[1-9]|[1-8]\d|9[0-8])\d{3}$/);
var contT0 = 0;
var contT1 = 0;
var contT2 = 0;
var contT3 = 0;

$("#AddressEnv").on("click", function() {
	let msnError = "Vous devez sélectionner une adresse dans la liste!!!";
	contT0 = 0;
	if ($(this).val() == "Choisir une adresse") {
		$(".error" + $(this).prop("id")).text(msnError);
		$(this).addClass("is-invalid");
		contT0++;
	} else {
		$(".error" + $(this).prop("id")).text("");
		$(this).removeClass("is-invalid").addClass("is-valid");
		document.getElementById("adressL").value = $(this).val(); 
	}
});

$(".form-controlT").on("keyup", function() {
	let msnError = "Le numéro de téléphone est un champ obligatoire, Seuls les chiffres sont autorisés !!!";
	contT1 = 0;
	if ($(this).val() == "" || $(this).val().length < 10 || $(this).val().length > 13) {
		$(".error" + $(this).prop("id")).text(msnError);
		$(this).addClass("is-invalid");
		contT1++;
	} else {
		$(".error" + $(this).prop("id")).text("");
		$(this).removeClass("is-invalid").addClass("is-valid");

	}
	
	if ($(this).prop("id") == "phone") {
		if (!regexTelephone.test($(this).val())) {
			$(".error" + $(this).prop("id")).text(msnError);
			$(this).addClass("is-invalid");
			contT1++
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	}
	if (contT1 == 0) {
        document.getElementById('envformT').disabled = false;
    }else {
        document.getElementById('envformT').disabled = true;
    }

});


$(".form-controlAddE").on("keyup", function() {
	let msnError = " est un champ obligatoire!";
	contT2 = 0;
	champs = $(".form-controlAddE");
	$(champs).each(function() {
		if ($(this).val() == "" || $(this).val().length < 3) {
				$(".error" + $(this).prop("id")).text($(this).prop("placeholder") + msnError);
				$(this).addClass("is-invalid");
				contT2++;
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	});

	if ($(this).prop("id") == "inputZipCodeA") {
		if (!regexCodPostal.test($(this).val())) {
			$(".error" + $(this).prop("id")).text($(this).prop("placeholder") + " N'accepter que les chiffres");
			$(this).addClass("is-invalid");
			contT2++
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	}
	if (contT2 == 0) {
        document.getElementById('addressAddE').disabled = false;
    }else {
        document.getElementById('addressAddE').disabled = true;
    }

});


$(".form-controlAddF").on("keyup", function() {
	let msnError = " est un champ obligatoire!";
	contT3 = 0;
	champs = $(".form-controlAddF");
	$(champs).each(function() {
		if ($(this).val() == "" || $(this).val().length < 3) {
				$(".error" + $(this).prop("id")).text($(this).prop("placeholder") + msnError);
				$(this).addClass("is-invalid");
				contT3++;
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	});

	if ($(this).prop("id") == "inputZipCodeF") {
		if (!regexCodPostal.test($(this).val())) {
			$(".error" + $(this).prop("id")).text($(this).prop("placeholder") + " N'accepter que les chiffres");
			$(this).addClass("is-invalid");
			contT3++
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	}
	if (contT3 == 0) {
        document.getElementById('addressAddF').disabled = false;
    }else {
        document.getElementById('addressAddF').disabled = true;
    }

});

function valdir(event){
	event.preventDefault();
	let msnError = "Vous devez sélectionner une adresse dans la liste!!!";
	contT0 = 0;
	if ($("#AddressEnv").val() == "Choisir une adresse") {
		$(".error" + $("#AddressEnv").prop("id")).text(msnError);
		$("#AddressEnv").addClass("is-invalid");
		contT0++;
		return 0;
	} else {
		$(".error" + $("#AddressEnv").prop("id")).text("");
		$("#AddressEnv").removeClass("is-invalid").addClass("is-valid");
		document.getElementById("adressL").value = $("#AddressEnv").val(); 
		document.formPaypal.submit();
	}
}





