class ClasesController < ApplicationController
	def index
		if current_usuario.rol_actual.id == 1
			render 'clases/index'
		else
			render 'clases/index_facilitador'
		end
	end

		def estudiante
			render "/estudiante/index"
		end

		def nuevo_material 
		end	

		def calendario_facilitador
			render "/clases/calendario_facilitador"
		end	


	
end