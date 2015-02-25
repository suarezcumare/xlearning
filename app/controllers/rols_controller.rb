class RolsController < ApplicationController
	before_action :authenticate_usuario!
	def index
		@roles = current_usuario.rols
		render json: @roles
	end
end
