class UsuarioController < ApplicationController
	def validaremail
		if Usuario.exists?(email: params[:email])
			return false
		else
			return true
		end
	end
end