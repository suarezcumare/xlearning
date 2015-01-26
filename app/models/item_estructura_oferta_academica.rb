class ItemEstructuraOfertaAcademica < ActiveRecord::Base
  belongs_to :estructura_oferta_academica, class_name: "EstructuraOfertaAcademica", foreign_key: "est_oferta_acad_id"
  has_many :hijos, class_name: "ItemEstructuraOfertaAcademica"
  belongs_to :padre, class_name: "ItemEstructuraOfertaAcademica", foreign_key: "padre_id"
  has_many :cursos, class_name: "Curso"
end
