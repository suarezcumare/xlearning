class UsuarioController < ApplicationController
	def validar_email
		if Usuario.exists?(email: params[:usuario][:email])
			render json: false
		else
			render json: true
		end
	end


	def perfil_index
		render "usuarios/perfil"

	end
	def perfil_editar
		render "usuarios/editar"
	end
end