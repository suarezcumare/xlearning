class EstructuraOfertaAcademica < ActiveRecord::Base
  has_many :hijos, class_name: "EstructuraOfertaAcademica", foreign_key: "padre_id"
  belongs_to :padre, class_name: "EstructuraOfertaAcademica"
end
