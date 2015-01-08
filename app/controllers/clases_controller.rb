class ClasesController < ApplicationController

		def estudiante
			render "/estudiante/index"
		end

		def nuevo_material 
		end	

		def calendario_facilitador
			render "/clases/calendario_facilitador"
		end	


	
end