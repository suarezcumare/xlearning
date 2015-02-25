class Modulo < ActiveRecord::Base
  belongs_to :curso
  has_many :contenidos
  has_many :objeto_aprendizajes, :through => :contenido
  has_many :evaluacions
  accepts_nested_attributes_for :evaluacions

end
