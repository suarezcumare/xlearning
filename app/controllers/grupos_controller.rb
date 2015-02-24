class GruposController < ApplicationController
	def index
 		@rol =  Rol.where(nombre: 'estudiante')

		 @rol =  Rol.where(nombre: 'estudiante')

		  if usuario_signed_in? and current_usuario.rol_actual.id == @rol[0].id

		  	 @clases = "Actuales"
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

	def pasados
		
		 @rol =  Rol.where(nombre: 'estudiante')

		 @rol =  Rol.where(nombre: 'estudiante')

		  if usuario_signed_in? and current_usuario.rol_actual.id == @rol[0].id
		  	
		  	 @clases = "Pasadas"
		  	render "grupos/index"
		  	
		  else
		  	if usuario_signed_in?
		  		render "devise/registrations/new" #deberia ser para cambiar rol
		  	else
		  		render "devise/registrations/new"
		  	end
		   end

	end

	def futuros
		
 		@rol =  Rol.where(nombre: 'estudiante')

		 @rol =  Rol.where(nombre: 'estudiante')

		  if usuario_signed_in? and current_usuario.rol_actual.id == @rol[0].id
		  	
		  	 @clases = "Futuras"
		  	render "grupos/index"
		  	
		  else
		  	if usuario_signed_in?
		  		render "devise/registrations/new" #deberia ser para cambiar rol
		  	else
		  		render "devise/registrations/new"
		  	end
		   end

	end


	def generarClasesActuales
  		@grupos = Grupo.includes(:curso).where('fecha_inicio <= ? and ? <= fecha_fin and usuario_id = ?', Time.now.midnight,Time.now.midnight, current_usuario.id )

   @son2 = @grupos.count

   if @son2 > 0 
	    @i2=1
	    $tirajson2 = '[ '
	    modulo = Modulo.new
	 @grupos.each do |grupos|
	      	if @i2<@son2
				

				$tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","porcentaje": "' + modulo.porcentajeCurso(grupos.id).to_s + "%" +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'  "/clases/"   + grupos.id.to_s +  '"}, '
	        else
				 $tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","prerequisitos": "'+ 	grupos.curso.prerequisitos.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","porcentaje": "'+   modulo.porcentajeCurso(grupos.id).to_s + "%" +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'    "/clases/" + grupos.id.to_s +  '"} '
	      end
	    		@i2=@i2+1
	  end
	   	 $tirajson2 = $tirajson2 + ' ]'
   else
    $tirajson2 = '[ ]'; 
   end
   
  		render :json => $tirajson2 

	end

	def generarClasesPasadas

  @grupos = Grupo.includes(:curso).where('fecha_inicio <= ? and ? > fecha_fin and usuario_id = ?', Time.now.midnight,Time.now.midnight, current_usuario.id )

   @son2 = @grupos.count

   if @son2 > 0 
	    @i2=1
	    $tirajson2 = '[ '
	 @grupos.each do |grupos|
	      	if @i2<@son2

				$tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'  "/clases/"   + grupos.id.to_s +  '"}, '
	        else
				 $tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","prerequisitos": "'+ 	grupos.curso.prerequisitos.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'    "/clases/" + grupos.id.to_s +  '"} '
	      end
	    		@i2=@i2+1
	  end
	   	 $tirajson2 = $tirajson2 + ' ]'
   else
    $tirajson2 = '[ ]'; 
   end
   
  		render :json => $tirajson2 

	end

	def generarClasesFuturas

  @grupos = Grupo.includes(:curso).where('fecha_inicio >= ? and ? <= fecha_fin and usuario_id = ?', Time.now.midnight,Time.now.midnight, current_usuario.id )

   @son2 = @grupos.count

   if @son2 > 0 
	    @i2=1
	    $tirajson2 = '[ '
	 @grupos.each do |grupos|
	      	if @i2<@son2

				$tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'  "/clases/"   + grupos.id.to_s +  '"}, '
	        else
				 $tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupos.id.to_s +
											'","nombre": "'+ grupos.curso.nombre.to_s +
											'","fechaI": "'+ grupos.fecha_inicio.to_s +
											'","fechaF": "'+ grupos.fecha_inicio.to_s +
											'","descripcion": "'+ grupos.curso.descripcion.to_s +
											'","objetivos": "'+ grupos.curso.objetivos.to_s +
											'","perfil": "'+ 	grupos.curso.perfil_estudiante.to_s +
											'","prerequisitos": "'+ 	grupos.curso.prerequisitos.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupos.curso.foto.to_s +
											'","modal": "'  "/cursos/" + grupos.id.to_s + "/ver" +
											'","url": "'    "/clases/" + grupos.id.to_s +  '"} '
	      end
	    		@i2=@i2+1
	  end
	   	 $tirajson2 = $tirajson2 + ' ]'
   else
    $tirajson2 = '[ ]'; 
   end
   
  		render :json => $tirajson2 

	end

	def generarListaDeseos
		@grupos = Grupo.includes(:curso).where("grupos.usuario_id != ?", current_usuario.id).limit(2)
   @son2 = @grupos.count

   if @son2 > 0 
	    @i2=1
	    $tirajson2 = '[ '
	 @grupos.each do |grupo|
	      	if @i2<@son2

				$tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupo.curso.id.to_s +
											'","nombre": "'+ grupo.curso.nombre.to_s +
											'","descripcion": "'+ grupo.curso.descripcion.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupo.curso.foto.to_s +
											'","url": "'  "/cursos/"   + grupo.curso.id.to_s + "/ver"  '"}, '
	        else
				 $tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupo.curso.id.to_s +
											'","nombre": "'+ grupo.curso.nombre.to_s +
											'","descripcion": "'+ grupo.curso.descripcion.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupo.curso.foto.to_s +
											'","url": "'  "/cursos/"   + grupo.curso.id.to_s + "/ver"  '"} '
	      end
	    		@i2=@i2+1
	  end
	   	 $tirajson2 = $tirajson2 + ' ]'
   else
    $tirajson2 = '[ ]'; 
   end
   
  		render :json => $tirajson2 

		
	end

	def generarListaRecomendados

		
@grupos = Grupo.includes(:curso).where("grupos.usuario_id != ?", current_usuario.id).limit(2)
   @son2 = @grupos.count

   if @son2 > 0 
	    @i2=1
	    $tirajson2 = '[ '
	 @grupos.each do |grupo|

	      	if @i2<@son2

				$tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupo.curso.id.to_s +
											'","nombre": "'+ grupo.curso.nombre.to_s +
											'","descripcion": "'+ grupo.curso.descripcion.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupo.curso.foto.to_s +
											'","url": "'  "/cursos/"   + grupo.curso.id.to_s + "/ver"  '"}, '
	        else
				 $tirajson2 = $tirajson2 +   ' { "codigo": "'  + grupo.curso.id.to_s +
											'","nombre": "'+ grupo.curso.nombre.to_s +
											'","descripcion": "'+ grupo.curso.descripcion.to_s +
											'","img": "' "/" + request.subdomain + "/cursos/" + 	grupo.curso.foto.to_s +
											'","url": "'  "/cursos/"   + grupo.curso.id.to_s + "/ver"  '"} '
	      end
	    		@i2=@i2+1
	  end
	   	 $tirajson2 = $tirajson2 + ' ]'
   else
    $tirajson2 = '[ ]';

   end
   
  		render :json => $tirajson2 

		
	end


end
