class PagoMembresia < ActiveRecord::Base
  has_one :modo_pago
  belongs_to :usuario
end
