class CreateItemResumen < ActiveRecord::Migration
  def change
    create_table :item_resumen do |t|
      t.text :titulo
      t.text :descripcion
      t.references :resumen, index: true

      t.timestamps
    end
  end
end
