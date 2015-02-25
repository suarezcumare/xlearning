class ObjetoAprendizaje < ActiveRecord::Base
	has_many :objeto_aprendizaje_archivos
	has_many :contenidos
	belongs_to :tipo_archivo, class_name: "TipoArchivo", foreign_key: "tipo_archivo_id"
	has_many :modulos, :through => :contenidos
	has_many :eventos, as: :trackeable
end
