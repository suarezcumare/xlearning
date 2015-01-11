class GruposController < ApplicationController
	def index
		render "grupos/index"
	end

	def show
		render "clases/index"
	end

	def facilitador_secciones
		render "facilitador_secciones"
		
	end
	def coordinador_secciones
		render "coordinador_secciones"
		
	end
end
