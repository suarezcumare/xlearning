=begin
  organizacions_controller.rb

  Laboratorio III. Dreamteam B. / Ejecutivo Desktop 

  Proyecto  : Xlearning 
  
      Autores :     C.I         Email
    Asaro Guillermo   C.I.: 20.010.162  guillermoasaro@gmail.com
  Bravo Jhosedith   C.I.: 20.237.969  jhosedithbravo.23@gmail.com
  Maldonado Carlex  C.I.: 22.331.306  c.valentinamm@gmail.com
  Suarez Tony     C.I.: 20.671.198  suarezcumare@gmail.com

  
  Ultima Modificación, Fecha  : 07 de enero del 2015
=end

class ContenidosController < ApplicationController
	def index
	end
	def new
	end

	def destroy
		if Modulo.exists? params[:modulo_id]
			@modulo = Modulo.find(params[:modulo_id])
			@contenido = @modulo.contenidos.where("objeto_aprendizaje_id=?", params[:id])
			#@contenido.destroy
			render :json "ok"
		else
			render :json "Imposible eliminar"
		end
	end

	def create
	end
	def edit
	end
	def save
	end
end