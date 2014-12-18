class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nombre
      t.binary :foto
      t.string :formato_foto
      t.string :sexo
      t.text :intereses
      t.string :ocupacion
      t.references :usuario, index: true
    end
  end
end
