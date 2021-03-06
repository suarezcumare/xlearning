class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :orden
      t.boolean :estatus
      t.references :curso, index: true
    end
  end
end
