=begin
	encuesta_controller.rb

	Laboratorio III. Dreamteam B. / Ejecutivo Desktop 

	Proyecto  : Xlearning 
 	
  		Autores	:	 		C.I 				Email
  	Asaro Guillermo 	C.I.: 20.010.162 	guillermoasaro@gmail.com
 	Bravo Jhosedith 	C.I.: 20.237.969 	jhosedithbravo.23@gmail.com
	Maldonado Carlex 	C.I.: 22.331.306 	c.valentinamm@gmail.com
	Suarez Tony 		C.I.: 20.671.198 	suarezcumare@gmail.com

	
  Ultima Modificación, Fecha  : 07 de enero del 2015
=end

class ModulosController < ApplicationController
	def destroy
		if Curso.exists? params[:curso_id]
			@curso = Curso.find(params[:curso_id])
			@modulo = @curso.modulos.find(params[:id])
			#@modulo.destroy
			render json: "ok"
		else
			render json: "Modulo no encontrado"
		end
	end

	def create
		if Curso.exists? params[:curso_id]
			@curso = Curso.find(params[:curso_id])
			if @curso.modulos.exists? params[:modulo][:id]
				@modulo = @curso.modulos.find(params[:modulo][:id])
				@modulo.descripcion = params[:modulo][:descripcion]
				@modulo.nombre = params[:modulo][:nombre]
				@modulo.save
			else
				@modulo = @curso.modulos.create(nombre: params[:modulo][:nombre],
									 descripcion: params[:modulo][:descripcion])
			end
			@modulo.asignacions
			@modulo.evaluacions
			@modulo.objeto_aprendizajes
			@modulo.objeto_aprendizajes.each do |m|
				m.tipo_archivo
			end
			
			render json: @modulo.to_json(:include=>{
		    								:evaluacions => {},
		    								:asignacions => {},
		    								:objeto_aprendizajes=>{
		    									:include=>{
		    										:tipo_archivo=>{
		    											:only=>[:icono,:nombre]}
		    										}
		    									}
		    								})
		else
			render json: "Curso no encontrado"
		end
	end
end