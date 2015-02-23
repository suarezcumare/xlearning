class Pregunta < ActiveRecord::Base
	belongs_to :evaluacion, class_name: "Evaluacion", foreign_key: "evaluacion_id"
	has_many :respuesta
end
