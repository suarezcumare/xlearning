$(document).ready(function(){
	$("#new_usuario").validate({
		rules: {
			"usuario[email]":{
				email:true,
				required:true,
			    remote: {
			       	url: "validar_email",
			       	type: "post",
			       	data: {
			       		email: function() {
			         		return $( "#usuario_email" ).val();
			       		}
			       	}
        		}
			},
			"usuario[password]":{
				required:true,
				minlength:8,
				maxlength:30
			},
			"usuario[password_confirmation]":{
				equalTo: "#usuario_password"
			},
			terminos:"required"
		},
		messages:{
			"usuario[email]":{
				email:"Indica un correo electrónico válido",
				required:"Indica tu correo electrónico",
				//remote:"Ya existe una cuenta asociada a este correo"
			},
			"usuario[password]":{
				required:"Indica una contraseña",
				minlength:"Tu contraseña debe tener mínimo 8 caracteres"
			},
			"usuario[password_confirmation]":{
				equalTo: "Las contraseñas no coinciden"
			}	
		},
		errorClass:"msj-error"
	});


	$("#form-iniciar-sesion").validate({
		rules:{
			"usuario[email]":"required",
			"usuario[password]":"required"
		},
		groups:{
			cuenta: "usuario[email] usuario[password]"
		}
	});
});