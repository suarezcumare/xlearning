class Evaluacion < ActiveRecord::Base
  has_many :pregunta
  has_many :evaluacion_grupos
  has_many :grupos, :through => :evaluacion_grupos
  belongs_to :curso
end
