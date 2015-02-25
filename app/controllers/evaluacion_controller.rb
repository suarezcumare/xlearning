class EvaluacionController < ApplicationController
	def overview
		render "evaluacion/overview"
	end
	def presentar
		render "evaluacion/presentar"
	end

	def destroy
		if Modulo.exists? params[:modulo_id]
			@modulo = Modulo.find(params[:modulo_id])
			@evaluacion = @modulo.evaluacions.find(params[:id])
			#@evaluacion.destroy
			render :json "ok"
		else
			render :json "Evaluacion no encontrada"
		end
		
	end
end
