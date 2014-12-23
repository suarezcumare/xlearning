class Curso < ActiveRecord::Base
	has_one :rating
	has_one :facilitador, class_name: "Usuario",
	                      foreign_key: "facilitador_id"
	has_many :modulos
	has_many :prelacions
	has_many :comentarios, class_name: "CriticaCurso",
							foreign_key: "comentario_id"
	has_many :cursos, :through => :prelacions
	has_many :curso_categoria
  	has_many :categoria, :through => :curso_categoria
end
