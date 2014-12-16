class OpcionMenu < ActiveRecord::Base
  has_many :menus
  has_many :opcion_menus, :through => :menus
end
