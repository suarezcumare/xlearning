class CriticaCurso < ActiveRecord::Base
  belongs_to :autor, class_name: "Usuario",
	                foreign_key: "autor_id"
  belongs_to :curso
end
