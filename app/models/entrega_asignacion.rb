class EntregaAsignacion < ActiveRecord::Base
  belongs_to :asignaciongrupo
  has_one :tipoformato
  belongs_to :usuario
end
