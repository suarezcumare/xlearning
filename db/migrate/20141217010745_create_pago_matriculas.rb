class CreatePagoMatriculas < ActiveRecord::Migration
  def change
    create_table :pago_matriculas do |t|
      t.references :modo_pago, index: true
      t.references :matricula, index: true
      t.float :monto
      t.datetime :fecha
      t.string :numero_operacion
      t.boolean :estatus
    end
  end
end
