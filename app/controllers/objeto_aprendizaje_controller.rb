=begin
  organizacions_controller.rb

  Laboratorio III. Dreamteam B. / Ejecutivo Desktop 

  Proyecto  : Xlearning 
  
      Autores :     C.I         Email
    Asaro Guillermo   C.I.: 20.010.162  guillermoasaro@gmail.com
  Bravo Jhosedith   C.I.: 20.237.969  jhosedithbravo.23@gmail.com
  Maldonado Carlex  C.I.: 22.331.306  c.valentinamm@gmail.com
  Suarez Tony     C.I.: 20.671.198  suarezcumare@gmail.com

  
  Ultima Modificación, Fecha  : 07 de enero del 2015
=end

class ObjetoAprendizajeController < ApplicationController
	def index
	end
	def new
		@objetoAprendizaje = ObjetoAprendizaje.new
	end
	def create
	

	 @objetoAprendizaje = ObjetoAprendizaje.new
	 @objetoAprendizaje.nombre = params[:usuario][:nombre]
	 @objetoAprendizaje.descripcion = params[:usuario][:descripcion]

	 

	licencia = params[:usuario][:archivo_objeto_aprendizaje][:licencia_id]
	licencia = licencia.to_i + 1


		
		

    @archivoObjeto = ArchivoObjetoAprendizaje.new
    @archivoObjeto.uploaded_file = params[:laptop]

   	 @archivoObjeto.usuario_id = current_usuario.id
	 @archivoObjeto.fechasubido = Date.today

	 @lic = Licencia.where("id = ?", licencia)

	@lic.each do |fo|
	   @lic  = fo
	end

   @archivoObjeto.licencia_id = @lic.id 

		if ! params[:usuario][:archivo_objeto_aprendizaje][:archivolaptop].nil?
			disposi = "desktop"
	 	dis = Dispositivo.where("nombre = ?", disposi)

				dis.each do |fo|
			   		dis  = fo
			   	end
			@archivoObjeto.dispositivo_id = dis.id			
		 end

			if ! params[:usuario][:archivo_objeto_aprendizaje][:biblioteca].nil?
				@archivoObjeto.estatus_biblioteca = true
			else
				@archivoObjeto.estatus_biblioteca = false
			end
		
		 @objetoAprendizaje.save


		
		@archivoObjeto.objeto_aprendizaje_id = @objetoAprendizaje.id
 		
 		@archivoObjeto.save

 		render "objeto_aprendizaje/new"

		
	end
	def edit
	end
	def save_archivo
	end


 def mostrar_archivo 
	  @archivo = ArchivoObjetoAprendizaje.find(params[:id])

	  @tipo_for = TipoFormato.where("id = ?", @archivo.tipo_formato_id)

	  @tipo_for.each do |tip|
	  	@tipo_for = tip
	  end

	  @data = @archivo.archivo
	  send_data @data,type: @tipo_for.nombre,  :filename => @archivo.filename, 
	                    :disposition => 'inline'
  end

   def descargar_archivo 
   	
	  @archivo = ArchivoObjetoAprendizaje.find(params[:id])

	  @tipo_for = TipoFormato.where("id = ?", @archivo.tipo_formato_id)

	  @tipo_for.each do |tip|
	  	@tipo_for = tip
	  end

	  send_data @archivo.archivo, :filename => @archivo.filename, type: @tipo_for.nombre

  end

end