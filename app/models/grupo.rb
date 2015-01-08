class Grupo < ActiveRecord::Base
  belongs_to :curso
  belongs_to :usuario
  has_many :notificacions
  has_many :matriculas
  has_many :asignacion_grupos
  has_many :asignacions, :through => :asignacion_grupos
  has_many :evaluacion_grupos
  has_many :evaluacions, :through => :evaluacion_grupos
end
