class Notificacion < ActiveRecord::Base
  belongs_to :notificble
  belongs_to :usuario
  belongs_to :tipo_notificacion
end
