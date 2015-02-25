class CursosController < ApplicationController
	before_action :authenticate_usuario!
  	def index
  	
	end

	def show
		respond_to do |format|
		    format.html  {
		    	@curso = Curso.find(params[:id])
		
			

	 			# facilitador_id = @curso.facilitador_id
				@facilitador = Usuario.where("id = ?", @curso.facilitador_id)

				 @facilitador.each do |facilitador|
				 	@facilitador = facilitador
				 end
							
				# @modulo = Modulo.includes(:curso).where("curso_id = ?", @curso.id).order("orden ASC")
				@modulo = @curso.modulos
		    }
		    format.json  { 
		    	if Curso.exists?(params[:id])
		    		curso = Curso.includes(:categoria, modulos: [:evaluacions, objeto_aprendizajes: [:tipo_archivo]]).find(params[:id])#: [:evaluacions, objeto_aprendizajes: [:tipo_archivo]])
		    		render :json => curso.to_json(:include => {:categoria=>{}, 
		    						:modulos => {:include=>{
		    								:evaluacions => {},
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

	def inscribir

		grupo = Grupo.find_by(id: params[:id])

		grupo2 = Grupo.new

		grupo2.fecha_inicio = grupo.fecha_inicio
		grupo2.fecha_fin = grupo.fecha_fin
		grupo2.cierre_inscripcion = grupo.cierre_inscripcion
		grupo2.curso_id = grupo.curso_id 
		grupo2.usuario.id =  params[:iduser]
		grupo2.save
		render "cursos/show"
	end

	def new
		# Curso.create!([
		# 	{nombre: 'Programacion .NET', descripcion: '.NET es un framework de Microsoft que hace un enfasis en la transparencia de redes, con independencia de plataforma de hardware y que permita un rápido desarrollo de aplicaciones.', objetivos: 'Buscar Respuestas al mercado de los negocios en entornos WEB, como competencia a la plataforma Java', prerequisitos: 'Nociones basicas de sql', perfil_estudiante: 'Desarrollar aplicaciones de una manera robusta y segura, rapida y economica', pago: true, costo: 2000.0, matricula_maxima: 100, puntaje_aprobacion: 90.0, horas_semanales: 7, estatus: true},{nombre: 'Desarrollo Orientado a Objetos', descripcion: 'El modelo vista controlador es uno de los mas implementados para el desarrollo orientado a objetos', objetivos: 'Mejorar la calidad del software brindando mayor rapidez al manejo de la base de datos', prerequisitos: 'Nociones basicas para el MVC', perfil_estudiante: 'Desarrollar programas seguros', pago: true, costo: 1000.0, matricula_maxima: 70, puntaje_aprobacion: 80.0, horas_semanales: 5, estatus: true},
		#  {nombre: 'Desarrollo web con Ruby', descripcion: 'El desarrollo web es de real importancia para lo que es la administracion de online de entidades bancarias,entidades de comunicacion, entre otros', objetivos: 'Brindar servicios web ', prerequisitos: 'Desarrollar programas seguros al alcance de nuestros clientes', perfil_estudiante: 'Brindar seguridad', pago: true, costo: 1300.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Logica de la matematica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Logica de la fisica", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
		# {nombre: 'Logica de la quimica', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: 'Interpretacion de lenguajes', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
		# {nombre: 'C#', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},{nombre: "Visual Basic", descripcion: "Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ", objetivos: "Manejar ciertos calculos como las integrales", prerequisitos: "Tener cierta logica para la matematica", perfil_estudiante: "Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso", pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true},
		# {nombre: 'Comandos basicos en consola', descripcion: 'Manejar numeros de manera rapida y practica, para mejorar la habilidad en la matematica ', objetivos: 'Manejar ciertos calculos como las integrales', prerequisitos: 'Tener cierta logica para la matematica', perfil_estudiante: 'Ser constante a la hora de practicar con los numeros, para asi mejorar y mantenerse al nivel del curso', pago: true, costo: 1550.0, matricula_maxima: 100, puntaje_aprobacion: 85.0, horas_semanales: 6, estatus: true}
		# ])

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

