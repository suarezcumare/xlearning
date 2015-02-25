class Pregunta < ActiveRecord::Base
	belongs_to :evaluacion, class_name: "Evaluacion", foreign_key: "evaluacion_id"
	has_many :respuesta, class_name: "Respuesta",:dependent => :destroy
end
