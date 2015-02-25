class ArchivoObjetoAprendizaje < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :objeto_aprendizaje
  has_one :licencia
  has_one :tipo_formato
  has_one :dispositivo



  def uploaded_file=(incoming_file)
    self.filename = incoming_file.original_filename

    @tipoF = TipoFormato.where("nombre = ?",  incoming_file.content_type) 
      
     @tipoF.each do |fo|
      @tipoF  = fo
     end

     if @tipoF.nil?
      @tipoF = TipoFormato.new
      @tipoF.nombre = incoming_file.content_type
      @tipoF.save

      self.tipo_formato_id = @tipoF.id
    self.archivo = incoming_file.read

    else

      self.tipo_formato_id = @tipoF.id
    self.archivo = incoming_file.read

    end


    
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  private
  def sanitize_filename(filename)
    #get only the filename, not the whole path (from IE)
    just_filename = File.basename(filename)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
