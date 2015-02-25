class Respuesta < ActiveRecord::Base
  belongs_to :pregunta, class_name: "Pregunta", foreign_key: "pregunta_id"
  belongs_to :respuesta_evaluacion_presentada


end
