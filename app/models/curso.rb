class Curso < ActiveRecord::Base
	has_one :rating
	has_many :modulos
	has_many :prelacions
	has_many :comentarios, class_name: "CriticaCurso"
	has_many :cursos, :through => :prelacions
	has_many :curso_categoria, class_name: "CursoCategoria"
	has_many :evaluacions
  	has_many :categoria, :through => :curso_categoria
  	belongs_to :item_estructura, class_name: "ItemEstructuraOfertaAcademica", foreign_key: "item_estructura_id"
  	has_many :grupo
end
