$(document).ready(function(){
	

    $("#agregar-red-social a").click(function(){
    	var source = this;
    	if($("#lista-redes-sociales").hasClass("vacia"))
    		$("#lista-redes-sociales").removeClass("vacia").addClass("llena");
    	var class_a = $(source).attr("class"),
    		class_i = $(source).children().first().attr("class");
    	$("#lista-redes-sociales").append("<li><div class='input-group'><span class='input-group-addon "+
    				class_a+"'><i class='"+class_i+"'></i></span>"+
  					"<input type='text' class='form-control'></div></li>");
    });
});