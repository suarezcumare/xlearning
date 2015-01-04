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
end