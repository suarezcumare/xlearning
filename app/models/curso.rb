class Curso < ActiveRecord::Base
	has_many :modulos
	has_many :prelacions
	has_many :cursos, :through => :prelacions
end
