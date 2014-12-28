$(document).ready(function(){
	$("#busqueda-trigger").click(function(){
		$("#top-search-bar").css("display","table");
	});
	$("#hide-search-bar").click(function(){
		$("#top-search-bar").css("display","none");
	});
	$("main").click(function(){
		$("#top-search-bar").css("display","none");
	});
    //$('.collapsible').collapsible();

    $('.submenu-trigger').click(function () {
  		if($(this).hasClass("open"))
  			$(this).removeClass("menu-open").addClass("menu-close");
  		else
  			$(this).removeClass("menu-close").addClass("menu-open");
  		console.log($(this));
	});
});


