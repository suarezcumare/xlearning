class PreguntaEvaluacionPresentada < ActiveRecord::Base
  belongs_to :evaluacion, class_name: "EvaluacionPresentada",
	                      foreign_key: "evaluacion_id"
  has_one :pregunta
  has_one :respuesta, class_name: "RespuestaEvaluacionPresentada",
	                      foreign_key: "respuesta_id" 
end
