class RolsController < ApplicationController
	def index
		@roles = current_usuario.rols
		render json: @roles
	end
end
