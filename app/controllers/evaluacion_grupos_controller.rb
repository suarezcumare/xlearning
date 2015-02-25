class EvaluacionGruposController < ApplicationController
	def new		
		@evaluacion=Evaluacion.new
		@evaluacion=Evaluacion.includes(pregunta: [:respuesta]).find(params[:id_evaluacion])
		render "evaluacion/presentar"	  
	end
	def lista
		@evaluacion=Evaluacion.all
	end
def nada
		@evaluacion=Evaluacion.new
		@evaluacionpresentada=EvaluacionPresentada.new	
	end
def create  
 		@evaluacionpresentada = EvaluacionPresentada.new( params[:evaluacionpresentada] )	 
    if @evaluacionpresentada.save
    	@evaluacionpresentada= {:fecha_presentacion => Time.now, :usuarioid => session[:id], :puntuacion =>params[:puntuacion]}
     	 flash[:notice] = 'Examen guardado'
     	 redirect_to :action => 'create'
    else
      	render :action => 'new'
    end
end
end