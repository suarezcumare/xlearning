class UsuariosController < ApplicationController		
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

		render "usuarios/show"
	end

	def save_foto

		dir = "public/"+ request.subdomain + "/avatar"
		 FileUtils.mkdir_p(dir) unless File.directory?(dir)
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
		
		render "usuarios/edit"



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
	      accessible = [ :nombre, :apellido, :email,:organizacion_attributes => [ :id, :nombre, :descripcion, :subdominio,:contratos_attributes => [:id, :plan_id, :frecuencia_pago_id]] ] # extend with your own params
	      accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
	      params.require(:usuario).permit(accessible)
	    end

	      def usuario_params
	      accessible = [ :nombre, :apellido, :email,:organizacion_attributes => [ :id, :nombre, :descripcion, :subdominio,:contratos_attributes => [:id, :plan_id, :frecuencia_pago_id]] ] # extend with your own params
	      accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
	      params.require(:usuario).permit(accessible)
	    end
end