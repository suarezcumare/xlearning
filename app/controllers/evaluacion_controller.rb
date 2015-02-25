class EvaluacionController < ApplicationController

	before_action :authenticate_usuario!
	def overview
		@evaluaciongrupos=EvaluacionGrupo.new
		@evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ? and evaluacion_id = ? ", params[:id], params[:id_evaluacion]).limit(1)

		@evaluaciongrupos.each do |eval|
			@evaluaciongrupos = eval
		end		
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

	#	private
#  def pregunta_params
 #   params.require(:pregunta).permit(:enunciado)
  #end

end
#:pregunta, :evaluacion_grupos,:grupos)
 #<%= @respuesta.each do |respuesta| %>
