class UsuariosController < ApplicationController
before_action :authenticate_usuario!		
	def validar_email
		if Usuario.exists?(email: params[:usuario][:email])
			render json: false
		else
			render json: true
		end
	end


	def show
		@u_id = params[:id]
		usua = Usuario.where("id = ?", @u_id)
		usua.each do |usuario|
			@usuario = usuario;
		end

	@usuredes = UsuarioRedSocial.includes(:red_social).where("usuario_id = ?", @usuario.id)

	end

	def edit
			if usuario_signed_in? 

				@usuario = current_usuario

			else
				redirect_to root_path
			end	
	end

	def new
		if usuario_signed_in?
			redirect_to root_path
		else
			@usuario = Usuario.new
			if request.subdomain.present?
				render "devise/registrations/new"
			else
				@usuario.build_organizacion
				@usuario.organizacion.contratos.build
				render "usuarios/new"
			end
		end
	end

	def create
		@usuario = Usuario.new(usuario_params)
		# @pago = Pago.new
		# @pago.monto =  params[:pago][:monto]
		# @pago.modo_pago = ModoPago.find(params[:modo_pago])
		# @usuario
		@respuesta = Hash.new
	    if @usuario.save 	    	
	       @respuesta["codigo"] = 200
	       @respuesta["url"] = entrar_url(:subdomain => @usuario.organizacion.subdominio)
	    else  
	       @respuesta["codigo"] = 500
	       @respuesta["errores"] = @usuario.errors.full_messages
	    end  
	    render json: @respuesta
	end

	def preferencias
		if usuario_signed_in? 

				@usuario = current_usuario

			else
				redirect_to root_path
			end	
	end

	def preferencias_guardar
		@usuario = current_usuario


		render "usuarios/preferencias"
	end

	def save

		 @usuario = current_usuario

		 @usuario.update(usuario_params_organizacion)

		 if ! params[:usuario][:perfil_attributes][:googleplus].nil?
		 		red_social = RedSocial.find_by(nombre: 'googleplus')
		 	
		 		usuarioR = UsuarioRedSocial.where("usuario_id = ? and red_social_id = ?", current_usuario.id, red_social.id)
		 		usuarioR.each do |us|
		 			usuarioR = us
		 		end

		 		if ! usuarioR.nil?
		 			usuarioR.valor = params[:usuario][:perfil_attributes][:googleplus]
		 			usuarioR.save
		 		else 
			 		usuarioR = UsuarioRedSocial.new
			 		usuarioR.usuario_id = current_usuario.id
			 		usuarioR.red_social_id = red_social.id
			 		usuarioR.valor = params[:usuario][:perfil_attributes][:googleplus]
			 		usuarioR.save
		 		end
		 end
		 if ! params[:usuario][:perfil_attributes][:facebook].nil?

		 	red_social = RedSocial.find_by(nombre: 'facebook')
		 	
		 		usuarioR = UsuarioRedSocial.where("usuario_id = ? and red_social_id = ?", current_usuario.id, red_social.id)
		 		usuarioR.each do |us|
		 			usuarioR = us
		 		end

		 		if ! usuarioR.nil?
		 			usuarioR.valor = params[:usuario][:perfil_attributes][:facebook]
		 			usuarioR.save
		 		else 
			 		usuarioR = UsuarioRedSocial.new
			 		usuarioR.usuario_id = current_usuario.id
			 		usuarioR.red_social_id = red_social.id
			 		usuarioR.valor = params[:usuario][:perfil_attributes][:facebook]
			 		usuarioR.save
		 		end

		 end
		 if ! params[:usuario][:perfil_attributes][:twitter].nil?

		 	red_social = RedSocial.find_by(nombre: 'twitter')
		 	
		 		usuarioR = UsuarioRedSocial.where("usuario_id = ? and red_social_id = ?", current_usuario.id, red_social.id)
		 		usuarioR.each do |us|
		 			usuarioR = us
		 		end

		 		if ! usuarioR.nil?
		 			usuarioR.valor = params[:usuario][:perfil_attributes][:twitter]
		 			usuarioR.save
		 		else 
			 		usuarioR = UsuarioRedSocial.new
			 		usuarioR.usuario_id = current_usuario.id
			 		usuarioR.red_social_id = red_social.id
			 		usuarioR.valor = params[:usuario][:perfil_attributes][:twitter]
			 		usuarioR.save
		 		end

		 end
		 if ! params[:usuario][:perfil_attributes][:linkedin].nil?

		 	red_social = RedSocial.find_by(nombre: 'linkedin')
		 	
		 		usuarioR = UsuarioRedSocial.where("usuario_id = ? and red_social_id = ?", current_usuario.id, red_social.id)
		 		usuarioR.each do |us|
		 			usuarioR = us
		 		end

		 		if ! usuarioR.nil?
		 			usuarioR.valor = params[:usuario][:perfil_attributes][:linkedin]
		 			usuarioR.save
		 		else 
			 		usuarioR = UsuarioRedSocial.new
			 		usuarioR.usuario_id = current_usuario.id
			 		usuarioR.red_social_id = red_social.id
			 		usuarioR.valor = params[:usuario][:perfil_attributes][:linkedin]
			 		usuarioR.save
		 		end

		 end

		 if ! params[:usuario][:perfil_attributes][:github].nil?

		 	red_social = RedSocial.find_by(nombre: 'github')
		 	
		 		usuarioR = UsuarioRedSocial.where("usuario_id = ? and red_social_id = ?", current_usuario.id, red_social.id)
		 		usuarioR.each do |us|
		 			usuarioR = us
		 		end

		 		if ! usuarioR.nil?
		 			usuarioR.valor = params[:usuario][:perfil_attributes][:github]
		 			usuarioR.save
		 		else 
			 		usuarioR = UsuarioRedSocial.new
			 		usuarioR.usuario_id = current_usuario.id
			 		usuarioR.red_social_id = red_social.id
			 		usuarioR.valor = params[:usuario][:perfil_attributes][:github]
			 		usuarioR.save
		 		end

		 end


		@usuario = Usuario.find_by(id: current_usuario.id)
		@usuredes = UsuarioRedSocial.includes(:red_social).where("usuario_id = ?", @usuario.id)

		render "usuarios/show"
	end

	def save_foto
		dir = "public/systems/"+ request.subdomain + "/avatar"

		@usuario = current_usuario

		  @perfil = Perfil.where("usuario_id = ?", @usuario.id)
		  @perfil.each do |per|
		  	@perfil = per
		  end

		  #Archivo subido por el usuario.
	      archivo = params[:avatar_id]
	      #Nombre original del archivo.
	      nombre = archivo.original_filename


	      #Extensión del archivo.
	      extension = nombre.slice(nombre.rindex("."), nombre.length).downcase

	       #Nombre original del archivo.
	      nombre = @usuario.id.to_s + extension
	      
	     archivo.original_filename = nombre


         #Ruta del archivo.
         path = File.join(dir, nombre)
         #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
         resultado = File.open(path, "wb") { |f| f.write(archivo.read) }
         #Verifica si el archivo se subió correctamente.

    	  @perfil.foto = nombre

    	  @perfil.save
		
		render "/usuarios/edit"



		# def cleanup
  #   File.delete("#{RAILS_ROOT}/dirname/#{@filename}") 
  #           if File.exist?("#{RAILS_ROOT}/dirname/#{@filename}")
  # 		end
		
	end


	def finish_signup
	    # authorize! :update, @user 
	    if request.patch? && params[:usuario] #&& params[:user][:email]
	      if @usuario.update(usuario_params)
	        @usuario.skip_reconfirmation!
	        sign_in(@usuario, :bypass => true)
	        redirect_to @usuario, notice: 'Your profile was successfully updated.'
	      else
	        @show_errors = true
	      end
	    end
	end

    private
	    def set_user
	      @usuario = Usuario.find(params[:id])
	    end

	    def usuario_params
	      accessible = [ :nombre, :apellido, :email,:perfil_attributes => [ :id, :sexo, :ocupacion, :biografia,:intereses ] ] # extend with your own params
	      accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
	      params.require(:usuario).permit(accessible)
	    end

	      def usuario_params
	      accessible = [ :nombre, :apellido, :email,:organizacion_attributes => [ :id, :nombre, :descripcion, :subdominio,:contratos_attributes => [:id, :plan_id, :frecuencia_pago_id]] ] # extend with your own params
	      accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
	      params.require(:usuario).permit(accessible)
	    end

	     def usuario_params_organizacion
	      accessible = [ :nombre, :apellido, :email,:organizacion_attributes => [ :id, :nombre, :descripcion, :subdominio,:contratos_attributes => [:id, :plan_id, :frecuencia_pago_id]] ] # extend with your own params
	      accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
	      params.require(:usuario).permit(accessible)
	    end
	    
end