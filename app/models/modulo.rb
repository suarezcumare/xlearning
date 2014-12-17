class Modulo < ActiveRecord::Base
  belongs_to :curso
  has_many :contenidos
  has_many :objeto_aprendizajes, :through :contenido
end
