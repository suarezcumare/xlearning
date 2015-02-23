class ArchivoObjetoAprendizaje < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :objeto_aprendizaje
  has_one :licencia
  has_one :tipo_formato
  has_one :dispositivo
end
