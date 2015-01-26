class CreateItemEstructuraOfertaAcademicas < ActiveRecord::Migration
  def change
    create_table :item_estructura_oferta_academicas do |t|
      t.string :nombre
      t.references :est_oferta_acad, index: true
      t.references :padre, index: true
    end
  end
end
