class CursosController < ApplicationController
  	def index
  	
	end

	def show
		@curso = Curso.where('cursos.id = ?', params[:id]).limit(1)
		
		@curso.each do |curso|
			@curso  = curso
		end

		 			facilitador_id = @curso.facilitador_id
					@facilitador = Usuario.where("id = ?", facilitador_id)

					@facilitador.each do |facilitador|
						@facilitador = facilitador
					end
					
			@modulo = Modulo.includes(:curso).where("curso_id = ?", @curso.id).order("orden ASC")


	end

	def edit
		render "/cursos/edit"
	end
end

