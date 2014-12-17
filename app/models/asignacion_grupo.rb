class AsignacionGrupo < ActiveRecord::Base
  belongs_to :grupo
  belongs_to :asignacion
  has_many :entrega_asignacions
end
