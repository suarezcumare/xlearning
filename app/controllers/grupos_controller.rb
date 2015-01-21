class GruposController < ApplicationController
	def index
 @rol =  Rol.where(nombre: 'estudiante')

		 @rol =  Rol.where(nombre: 'estudiante')

		  if usuario_signed_in? and current_usuario.rol_actual.id == @rol[0].id
			#Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
		  	
		  	@grupos = Grupo.includes(:curso).where('fecha_inicio <= ? and ? <= fecha_fin', Time.now.midnight,Time.now.midnight )
		  	#@cursos = Curso.find_by_sql("SELECT * FROM cursos INNER JOIN grupos ON cursos.id = grupos.curso_id where grupos.usuario_id = #{current_usuario.id}")
		  	#@cursos = Curso.all
		  	render "grupos/index"
		  else
		  	if usuario_signed_in?
		  		render "devise/registrations/new" #deberia ser para cambiar rol
		  	else
		  		render "devise/registrations/new"
		  	end
		   end

		

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
	def politica_admision
		
		
	end
end
