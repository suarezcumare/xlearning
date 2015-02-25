class CursosController < ApplicationController
  	def index
  	
	end
	def create
		if params[:curso][:id] == ""
			@curso = Curso.new
		else
			@curso = Curso.includes(:categoria).find(params[:curso][:id])
		end	
		@curso.nombre = params[:curso][:nombre]
		@curso.descripcion = params[:curso][:descripcion]
		@curso.objetivos = params[:curso][:objetivos]
		@curso.prerequisitos = params[:curso][:prerequisitos]
		@curso.perfil_estudiante = params[:curso][:perfil_estudiante]
		@curso.pago = params[:curso][:pago]
		@curso.costo = params[:curso][:costo]
		@curso.matricula_maxima = params[:curso][:matricula_maxima]
		@curso.puntaje_aprobacion = params[:curso][:puntaje_aprobacion]
		@curso.horas_semanales = params[:curso][:horas_semanales]
		@curso.item_estructura_id = params[:curso][:item_estructura_id]
		@curso.save
		render json: @curso.to_json(:include => [:categoria])		
	end

	def show
		respond_to do |format|
		    format.html  {
		    	@curso = Curso.find(params[:id])
		
				# @curso.each do |curso|
				# 	@curso  = curso
				# end

	 			# facilitador_id = @curso.facilitador_id
				@facilitador = Usuario.where("id = ?", @curso.facilitador.id)

				# @facilitador.each do |facilitador|
				# 	@facilitador = facilitador
				# end
							
				# @modulo = Modulo.includes(:curso).where("curso_id = ?", @curso.id).order("orden ASC")
				@modulo = @curso.modulos
		    }
		    format.json  { 
		    	if Curso.exists?(params[:id])
		    		curso = Curso.includes(:categoria, modulos: [:asignacions, :evaluacions, objeto_aprendizajes: [:tipo_archivo]]).find(params[:id])#: [:evaluacions, objeto_aprendizajes: [:tipo_archivo]])
		    		render :json => curso.to_json(:include => {:categoria=>{}, 
		    						:modulos => {:include=>{
		    								:evaluacions => {},
		    								:asignacions => {},
		    								:objeto_aprendizajes=>{:include=>{:tipo_archivo=>{:only=>[:icono,:nombre]}}}}}})
		    	else
		    		render :json => false
		    	end
		    	
		    }
		end
	end

	def edit
		render "/cursos/edit"
	end

	def jerarquia
	end

	def crear_jerarquia
		
	end

	def destroy
		if Curso.exists? params[:id]
			curso = Curso.find(params[:id])
			#curso.destroy
			render json: "ok"
		else
			render json: "curso no encontrado"
		end
	end
end

