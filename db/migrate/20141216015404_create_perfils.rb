class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :foto
      t.string :formato_foto
      t.boolean :sexo
      t.text :intereses
      t.string :ocupacion
      t.references :usuario, index: true
      t.text :biografia 
      t.references :pais, index: true
      t.text :preferencia 
    end
  end
end
