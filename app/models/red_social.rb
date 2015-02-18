class RedSocial < ActiveRecord::Base
 has_many :usuario_red_social, class_name: "UsuarioRedSocial", foreign_key: "red_social_id"
 has_many :usuario, :through => :usuario_red_social

 has_many :organizacion_red_social, class_name: "OrganizacionRedSocial", foreign_key: "red_social_id"
 has_many :organizacion, :through => :organizacion_red_social
end
