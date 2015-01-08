class UsuarioNotificacion < ActiveRecord::Base
  has_one :notificacion
  belongs_to :usuario
end
