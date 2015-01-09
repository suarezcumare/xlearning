class EvaluacionGrupo < ActiveRecord::Base
  belongs_to :evaluacion
  belongs_to :grupo
  has_many :evaluacion_presentadas
  has_many :usuarios, :through => :evaluacion_presentadas
end
