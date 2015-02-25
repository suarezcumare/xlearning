class ItemEstructuraOfertaAcademica < ActiveRecord::Base
	has_closure_tree :name_column => "nombre", :dependent => :destroy

	belongs_to :estructura, class_name: "EstructuraOfertaAcademica",
			 foreign_key: "est_oferta_acad_id", :inverse_of => :items
	has_many :cursos, class_name: "Curso", foreign_key: "item_estructura_id"
end
