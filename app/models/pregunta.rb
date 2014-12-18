class Pregunta < ActiveRecord::Base
	belongs_to :evaluacion
	has_many :respuesta
end
