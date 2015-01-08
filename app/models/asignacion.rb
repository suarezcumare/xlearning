class Asignacion < ActiveRecord::Base
  belongs_to :curso
  has_many :asignacion_grupos
  has_many :grupos, :through => :asignacion_grupos
end
