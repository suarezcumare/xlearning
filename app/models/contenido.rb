class Contenido < ActiveRecord::Base
  belongs_to :modulo
  belongs_to :objeto_aprendizaje
end
