class RespuestaEvaluacionPresentada < ActiveRecord::Base
  belongs_to :respuesta
  has_one :respuesta
end
