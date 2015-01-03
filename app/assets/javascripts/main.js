$(document).ready(function(){
	$('ul.tabs').tabs();
	$('select').not('.disabled').material_select();
	$('.datepicker').pickadate();
	$('.modal-trigger').leanModal();
    $(".dropdown-toggle").dropdown();
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
  		if($(this).hasClass("menu-open"))
  			$(this).removeClass("menu-open").addClass("menu-close");
  		else
  			$(this).removeClass("menu-close").addClass("menu-open");
	});

    $(".favoritear").click(function(){
    	if($(this).hasClass("fav"))
    		$(this).removeClass("fav");
    	else
    		$(this).addClass("fav");
    	
    });

    $('.collapsible').collapsible({ "accordion" : false });

      
	$(document).scroll(function() {
	  var y = $(this).scrollTop();
	  if (y > 100) {
	    $('.scroll-to-top').fadeIn();
	  } else {
	    $('.scroll-to-top').fadeOut();
	  }
	});




	$(".scroll-to-top").click(function(){
		$('html,body').animate({
          scrollTop: 0
        }, 1000);
	});

	$(".visualizador-contenido").click(function(){
		var c = "<a href='javascript:void(0)' class='modal-close'><i class='mdi-content-clear'></i></a>";
		var u = $(this).attr("data-url");
		var t = $(this).attr("data-contenido"); 
		switch(t){
			case "imagen":
				c = c.concat("<img class='galeria' src='"+u+"'/>");
				c = c.concat("<div class='controles block-center'><a target='_blank' href='"+u+"'>"+
						"<i class='mdi-action-launch'></i></a><a href='"+u+"' download>"+
						"<i class='mdi-file-cloud-download'></i></a><a href='javascript:void(0)'>"+
						"<i class='fa fa-info'></i></a><div>");
				break;
			case "video":
				c = c.concat("<video width='320' height='240' autoplay>"+
  						"<source src='//www.youtube.com/embed/Q-ezaxiKe-Y' type='video/mp4'>"+
						"Your browser does not support the video tag.</video>");

				break;
		}
		$("#visualizador").html(c);
		$("#visualizador").openModal({
	        complete: function() { 
	        	$("#visualizador").html("");
	        } 
		});
	});
});
