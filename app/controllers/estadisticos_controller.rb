=begin
	estadisticos_controller.rb

	Laboratorio III. Dreamteam B. / Ejecutivo Desktop 

	Proyecto  : Xlearning 
 	
  		Autores	:	 		C.I 				Email
  	Asaro Guillermo 	C.I.: 20.010.162 	guillermoasaro@gmail.com
 	Bravo Jhosedith 	C.I.: 20.237.969 	jhosedithbravo.23@gmail.com
	Maldonado Carlex 	C.I.: 22.331.306 	c.valentinamm@gmail.com
	Suarez Tony 		C.I.: 20.671.198 	suarezcumare@gmail.com

	
  Ultima Modificación, Fecha  : 07 de enero del 2015
=end

class EstadisticosController < ApplicationController

	 def find
	    menu = Menu.includes(:opcionmenu).where(opcion_menus: {raiz: true}).where(rol_id: current_usuario.rol_actual.id).first
	    usuario = Usuario.includes(:rols).find(1)
	    #render json: usuario
	    render json: menu.to_json(:include => :opcionmenu)
  	end


	def index_organizacion
		
	end

	def estadistico_general

	end


	def estadistico_personalizado

	end
end