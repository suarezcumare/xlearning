class AsignacionsController < ApplicationController
	def overview
	end

	def presentar
	end
	def create
		if Modulo.exists? params[:modulo_id]
			@modulo = Modulo.find(params[:modulo_id])
			if @modulo.asignacions.exists? params[:asignacion][:id]
				@asignacion = @modulo.asignacions.find(params[:asignacion][:id])
				@asignacion.descripcion = params[:asignacion][:descripcion]
				@asignacion.titulo = params[:asignacion][:titulo]
				@asignacion.instrucciones = params[:asignacion][:instrucciones]
				@asignacion.puntuacion = params[:asignacion][:puntuacion]
				@asignacion.save
			else
				@asignacion = @modulo.asignacions.create(titulo: params[:asignacion][:titulo],
									 descripcion: params[:asignacion][:descripcion],
									 descripcion: params[:asignacion][:instrucciones],
									 descripcion: params[:asignacion][:puntuacion])
			end
			@asignacion.tipo_archivo = TipoArchivo.find(params[:asignacion][:tipo_archivo_id])
			@asignacion.save
			
			render json: @asignacion.to_json(:include=>[:tipo_archivo])
		else
			render json: "Curso no encontrado"
		end
	end
	def destroy
		if Modulo.exists? params[:modulo_id]
			@modulo = Modulo.find(params[:modulo_id])
			@asignacion = @modulo.asignacions.find(params[:id])
			#@asignacion.destroy
			render :json "ok"
		else
			render :json "Asignacion no encontrada"
		end
	end
end