class Evaluacion < ActiveRecord::Base
  has_many :pregunta, class_name: "Pregunta"
  has_many :evaluacion_grupos
  has_many :grupos, :through => :evaluacion_grupos
  belongs_to :modulo
end
