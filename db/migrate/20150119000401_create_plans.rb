class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :descripcion
      t.string :nombre
      t.float :costo
      t.integer :estatus

      t.timestamps
    end
  end
end
