class Categoria < ActiveRecord::Base
	has_many :curso_categoria
  	has_many :cursos, :through => :curso_categoria
end
