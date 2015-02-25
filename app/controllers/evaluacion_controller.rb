class EvaluacionController < ApplicationController
	def overview
		@evaluaciongrupos=EvaluacionGrupo.new
		@evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ? and evaluacion_id = ? ", params[:id], params[:id_evaluacion]).limit(1)

		@evaluaciongrupos.each do |eval|
			@evaluaciongrupos = eval
		end		
	end
	


	#	private
#  def pregunta_params
 #   params.require(:pregunta).permit(:enunciado)
  #end

end
#:pregunta, :evaluacion_grupos,:grupos)
 #<%= @respuesta.each do |respuesta| %>