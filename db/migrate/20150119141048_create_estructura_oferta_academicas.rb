class CreateEstructuraOfertaAcademicas < ActiveRecord::Migration
  def change
    create_table :estructura_oferta_academicas do |t|
      t.references :padre, index: true
      t.string :nombre
      t.boolean :raiz
      t.text :descripcion

      t.timestamps
    end
  end
end
