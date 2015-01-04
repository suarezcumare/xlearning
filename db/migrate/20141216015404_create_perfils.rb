class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.binary :foto
      t.string :formato_foto
      t.boolean :sexo
      t.text :intereses
      t.string :ocupacion
      t.references :usuario, index: true
      t.text biografia 
    end
  end
end
