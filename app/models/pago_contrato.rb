class PagoContrato < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :contrato
  belongs_to :modo_pago
end
