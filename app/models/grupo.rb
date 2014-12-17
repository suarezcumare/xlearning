class Grupo < ActiveRecord::Base
  belongs_to :curso
  belongs_to :usuario
  has_many :matriculas
  has_many :asignacion_grupos
  has_many :asignacions, :through => :asignacion_grupos
end
