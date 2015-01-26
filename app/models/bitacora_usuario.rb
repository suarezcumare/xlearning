class BitacoraUsuario < ActiveRecord::Base
  belongs_to :trackeable, polymorphic: true
  has_one :tipo_evento, class_name: "TipoEvento"
  belongs_to :usuario
end
