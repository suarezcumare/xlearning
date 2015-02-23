class Categoria < ActiveRecord::Base
	has_many :curso_categoria, class_name: "CursoCategoria"
  	has_many :cursos, :through => :curso_categoria
end
