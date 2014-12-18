class Historial < ActiveRecord::Base
  has_many :cursos
  belongs_to :usuario
end
