class PortalController < ApplicationController
	def index

		

		if usuario_signed_in?
			# if current_usuario.rol_actual.id == 1

				render "portal/index_estudiante"
			# end
		else

			render "portal/index"
		end

	end





end