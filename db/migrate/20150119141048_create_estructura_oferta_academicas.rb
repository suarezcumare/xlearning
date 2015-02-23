class CreateEstructuraOfertaAcademicas < ActiveRecord::Migration
  def change
    create_table :estructura_oferta_academicas do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :parent_id
    end
  end
end
