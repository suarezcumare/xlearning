class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.references :organizacion, index: true
      t.datetime :fecha_creacion
      t.text :observacion
      t.references :plan, index: true
      t.boolean :estatus
      t.references :frecuencia_pago, index: true
    end
  end
end
