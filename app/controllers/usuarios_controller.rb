class UsuariosController < ApplicationController		
	def validar_email
		if Usuario.exists?(email: params[:usuario][:email])
			render json: false
		else
			render json: true
		end
	end


	def show
		@usuario = Usuario.new
		@usuario.id = current_usuario.id
		#render "usuarios/perfil"
	end

	def edit
		@usuario = current_usuario
		# render plain: "renderizando usuarios/editar"
		#render "usuarios/editar"
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
end