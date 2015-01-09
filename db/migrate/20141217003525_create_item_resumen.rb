class CreateItemResumen < ActiveRecord::Migration
  def change
    create_table :item_resumen do |t|
      t.text :titulo
      t.text :descripcion
      t.references :resumen, index: true
    end
  end
end
