function loadCSS(filename){ 
	var file = document.createElement("link");
	file.setAttribute("rel", "stylesheet");
	file.setAttribute("type", "text/css");
	file.setAttribute("href", filename);
	document.head.appendChild(file);
}

loadCSS("./assets/css/validation.css");

$(document).ready(function() {
    setTimeout(function() {
        $(".timer").fadeOut(1500);
    },5000);  
});

/*************Validation Login****************/
var regexPass = new RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/);
var regexEmail = new RegExp(/^[A-Za-z0-9][A-Za-z0-9.-_]+[A-Za-z0-9][@][A-Za-z0-9][A-Za-z0-9.-_]+[A-Za-z0-9]?[\.][A-Za-z0-9]{2,3}$/);
var email = $(".email");
var password  = $(".password");
var passwordR  = $(".passwordR");
var envform = $(".envform");
var cont = 0;
var cont2 = 0;
var contL = 0;

function checkformM(event) {
	event.preventDefault();
	//envform.on("click", function() {
		cont = 0;
		let msnError = " est un champ obligatoire!!!!";
		champs = $(".form-controlV");
		$(champs).each(function(index, val) {
			if (val.value == "" || val.value.length > 30) {
				$(".error" + val.name).text(val.placeholder + msnError);
				$("#" + val.name).addClass("is-invalid");
				cont++;
	
	
			} else {
				$(".error" + val.name).text("");
				$("#" + val.name)
					.removeClass("is-invalid")
					.addClass("is-valid");
			}
		});
		

	    
	    if(password.val() != undefined && passwordR.val() != undefined){
			if(password.val() != passwordR.val()){
				$(".errorpasswordR").addClass("error");
				$(".errorpasswordR").text("Les deux mots de passe doivent être identiques.");
				$("#" + passwordR.attr("id")).addClass("is-invalid");
				cont++;
			}else{
				$(".errorpasswordR").addClass("error");
			    $(".errorpasswordR").text("");
				$("#" + passwordR.attr("id"))
						.removeClass("is-invalid")
						.addClass("is-valid");
			}
		}
	    if(email.val() != undefined){
			if (!regexEmail.test(email.val())) {
				$("#" + email.attr("id")).addClass("is-invalid");
				$(".error" + email.attr("id")).text("Vous devez saisir une adresse e-mail valide.");
				email.addClass("is-invalid");
				cont++
			} else {
				$(".error" + email.attr("id")).text("");
				email.removeClass("is-invalid").addClass("is-valid");
			}
		}
			if (cont == 0 && cont2 == 0) {
	    		document.formM.submit();
			}
	//});

    


}



 
function checkformML(event) {
	event.preventDefault();
	//$(".envformL").on("click", function() {
		contL = 0;
		let msnError = " est un champ obligatoire!!!!";
		champs = $(".form-controlV");
		$(champs).each(function(index, val) {
			if (val.value == "" || val.value.length > 30) {
				$(".error" + val.name).text(val.placeholder + msnError);
				$("#" + val.name).addClass("is-invalid");
				contL++;
			} else {
				$(".error" + val.name).text("");
				$("#" + val.name)
					.removeClass("is-invalid")
					.addClass("is-valid");
			}

		});
		if(email.val() != undefined){
			if (!regexEmail.test(email.val())) {
				$("#" + email.attr("id")).addClass("is-invalid");
				$(".error" + email.attr("id")).text("Vous devez saisir une adresse e-mail valide.");
				email.addClass("is-invalid");
				contL++
		
			} else {
				$(".error" + email.attr("id")).text("");
				email.removeClass("is-invalid").addClass("is-valid");
			}
		}
		
	//});

	if (contL == 0) {
	    document.formML.submit();
	}

}

/****************PASSWORD REGEX et MSN errors***************************/
var mdp = document.querySelector("#password");
var msn1 = document.querySelector("#num");
var msn2 = document.querySelector("#esp");
var msn3 = document.querySelector("#min");
var msn4 = document.querySelector("#maj");
var msn5 = document.querySelector("#char");
regex0 = /\d/;
regex1 = /[!@#$%^&*]/;
regex2 = /[a-z]/;
regex3 = /[A-Z]/;
/*******************************************/

function focusFunction() {
	document.querySelector("#passwordDiv").style.display = "block";
}

function blurFunction() {
	document.querySelector("#passwordDiv").style.display = "none";
}



$(".form-controlV").on("keyup", function() {
	let msnError = " est un champ obligatoire!!!";
	cont2 = 0;
	if ($(this).val() == "" || $(this).val().length > 25 || $(this).val().length < 2) {
		$(".error" + $(this).prop("id")).text($(this).prop("placeholder") + msnError);
		$(this).addClass("is-invalid");
		cont2++;
		if($(this).prop("id") == "password"){
			$(".errorpassword").css("height","20px");
		}
	} else {
		$(".error" + $(this).prop("id")).text("");
		$(this).removeClass("is-invalid").addClass("is-valid");
		if($(this).prop("id") == "password"){
			$(".errorpassword").css("height","8px");
		}
	}
	
	if ($(this).prop("id") == "password") {
		password = $(this);
		/*Validation password - nombres*/
		if (regex0.test($(this).val())) {
			msn1.classList.add("valid");
			msn1.classList.remove("invalid");
			cont2++
		} else {
			msn1.classList.remove("valid");
			msn1.classList.add("invalid");
		}
		/*Validation password - Caractères spéciaux*/
		if (regex1.test($(this).val())) {
			msn2.classList.add("valid");
			msn2.classList.remove("invalid");
			cont2++
		} else {
			msn2.classList.remove("valid");
			msn2.classList.add("invalid");
			cont2++
		}
		/*Validation password - minuscules*/
		if (regex2.test($(this).val())) {
			msn3.classList.add("valid");
			msn3.classList.remove("invalid");
			cont2++
		} else {
			msn3.classList.remove("valid");
			msn3.classList.add("invalid");
		}
		/*Validation password - majuscules*/
		if (regex3.test($(this).val())) {
			msn4.classList.add("valid");
			msn4.classList.remove("invalid");
			cont2++
		} else {
			msn4.classList.remove("valid");
			msn4.classList.add("invalid");
		}
		/*Validation password - plus de 8 characteres*/
		if ($(this).val().length >= 8) {
			msn5.classList.add("valid");
			msn5.classList.remove("invalid");
			cont2++
		} else {
			msn5.classList.remove("valid");
			msn5.classList.add("invalid");
		}

		if (!regexPass.test($(this).val())) {
			$(this).addClass("is-invalid");
			cont2++

		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}

	}
	if ($(this).prop("id") == "passwordR") {
		passwordR = $(this);
		if (!regexPass.test($(this).val())) {
			$(this).addClass("is-invalid");
			cont2++
		}
		else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	}

	if ($(this).prop("id") == "email") {
		email = $(this);
		if (!regexEmail.test($(this).val())) {
			$(this).addClass("is-invalid");
			cont2++
		} else {
			$(".error" + $(this).prop("id")).text("");
			$(this).removeClass("is-invalid").addClass("is-valid");
		}
	}
	
});




