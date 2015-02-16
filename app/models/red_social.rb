class RedSocial < ActiveRecord::Base
 has_many :usuario_red_social, class_name: "UsuarioRedSocial", foreign_key: "red_social_id"
 has_many :usuarios, :through => :usuario_red_social

 
end
