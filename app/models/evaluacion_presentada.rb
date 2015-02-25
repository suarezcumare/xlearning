class EvaluacionPresentada < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :evaluacion_grupo
  has_many :pregunta_evaluacion_presentadas, class_name: "PreguntaEvaluacionPresentada"
end
