class CreateResumen < ActiveRecord::Migration
  def change
    create_table :resumen do |t|
      t.string :titulo
      t.text :descripcion
      t.references :modulo, index: true

      t.timestamps
    end
  end
end
