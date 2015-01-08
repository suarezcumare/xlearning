class CreatePagoMembresia < ActiveRecord::Migration
  def change
    create_table :pago_membresia do |t|
      t.float :monto
      t.datetime :fecha
      t.string :numero_operacion
      t.references :modo_pago, index: true
      t.references :usuario, index: true
    end
  end
end
