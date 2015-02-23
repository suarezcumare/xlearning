class EstructuraOfertaAcademicasController < ApplicationController
	before_action :authenticate_usuario!
  	def index
  		@estructura = EstructuraOfertaAcademica.roots
  		listado = Array.new
  		@estructura.each do |e|
  			listado << e.self_and_descendants
  		end
  		render json: listado
	end
	
	def edit
		render "/cursos/edit"
	end

	def jerarquia
	end

	def crear_jerarquia
		
	end
	def destroy
		estructura = EstructuraOfertaAcademica.find(params[:id])
		if !params[:todo] || !estructura.leaf?
			if estructura.root?
				estructura.children[0].update(parent_id: nil)
			else
				estructura.children[0].update(parent_id: estructura.parent.id)
			end
		end
		estructura.children.clear
		estructura.save
		estructura.destroy()	
		render json: [estructura.children, params]
	end
	def new
		# EstructuraOfertaAcademica.find_or_create_by_path %w[Carrera Semestre Materia]
		# EstructuraOfertaAcademica.find_or_create_by_path %w[Especializacion Curso]
		# render json: "ok"
	end
end

