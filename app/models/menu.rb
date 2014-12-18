class Menu < ActiveRecord::Base
	belongs_to :rol
	has_many :hijos, class_name: "Menu",
	                      foreign_key: "padre_id"
	belongs_to :padre, class_name: "Menu"
	belongs_to :opcionmenu
end
