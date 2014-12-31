var ok = false;
$(document).ready(function(){
  	$.scrolline({
    	position:'bottom'
  	});

	$("#presentar-examen").submit(function(event){	
        return ok=true;
    });
    
  	$("#countdown").countdown360({
	  radius      : 50,
	  seconds     : 60,
	  strokeWidth : 12,
	  fillStyle   : '#fbfbfb',
	  strokeStyle : '#44C2D2',
	  fontSize    : 40,
	  unit        : "minutes",
	  label       : ["minuto", "minutos"],
	  fontColor   : '#5D5D5D',
	  autostart: false,
	  onComplete  : function () {
	  	ok = true;
	  	$("body").append(
	  		"<div id='end-msg' class='modal pad30 pad30-h col s3'><h4>aviso</h4>"+
			"<p>Se agoto el tiempo para presentar el examen.<br/>"+
			" A continuación se enviarán tus respuestas.</p>"+
			"<a href='javascript:void(0)' class='waves-effect btn-flat modal-close'>continuar</a>"+
				"</div>"
	  	);
	  	$("#end-msg").openModal({
	  		complete: function(){
	  			$("#presentar-examen").submit();
	  		}
	  	});
	  }
	}).start();
	
	$(window).bind('beforeunload', function(){
		console.log(ok);
		if(ok) return;
	    return confirm("Si cierras el cuestionario, se contará como un intento. ¿Abandonar esta página?");
	});
});
