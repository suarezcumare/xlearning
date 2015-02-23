class EvaluacionGruposController < ApplicationController
	def create
		redirect_to "/clases/1"
	end
	def new
		@evaluacion = Evaluacion.includes(:pregunta).find(params[:id_evaluacion])
		#@pregunta = Pregunta.find(1)#.includes(:pregunta).find(params[:id_evaluacion])
		render json: @evaluacion.to_json(:include => :pregunta)
		#render json: @pregunta
	end
end