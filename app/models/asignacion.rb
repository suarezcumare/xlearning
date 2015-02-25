class Asignacion < ActiveRecord::Base
  belongs_to :curso
  has_many :asignacion_grupos
  has_one :tipo_archivo
  has_many :grupos, :through => :asignacion_grupos
  belongs_to :modulo
end
