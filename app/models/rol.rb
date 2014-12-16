class Rol < ActiveRecord::Base
	has_many :usuario_rols
  	has_many :usuarios, :through => :usuario_rols
	has_many :menus
	has_many :opcion_menus, :through => :menus
end
