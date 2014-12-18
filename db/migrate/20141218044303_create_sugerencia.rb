class CreateSugerencia < ActiveRecord::Migration
  def change
    create_table :sugerencia do |t|
      t.text :contenido
      t.boolean :estatus
      t.references :usuario, index: true
    end
  end
end
