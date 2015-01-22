class ObjetoAprendizaje < ActiveRecord::Base
	has_many :objeto_aprendizaje_archivos
	has_many :contenidos
	has_many :modulos, :through => :contenidos
end
