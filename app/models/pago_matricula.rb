class PagoMatricula < ActiveRecord::Base
  belongs_to :modo_pago
  belongs_to :matricula
end
