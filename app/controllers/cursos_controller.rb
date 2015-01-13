class CursosController < ApplicationController
  	def index
  	
	end

	def show
		#@curso = Curso.find(params[:id])
	end

	def edit
		render "/cursos/edit"
	end
end

