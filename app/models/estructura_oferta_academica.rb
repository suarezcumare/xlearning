class EstructuraOfertaAcademica < ActiveRecord::Base
	has_closure_tree :name_column => "nombre", :dependent => :destroy
	has_many :items, class_name: "ItemEstructuraOfertaAcademica"
end
