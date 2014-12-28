class CreateOpcionMenus < ActiveRecord::Migration
  def change
    create_table :opcion_menus do |t|
      t.string :nombre
      t.raiz :estatus
      t.string :url
      t.references :padre, index: true
      t.references :menu, index: true
      t.string :icono
    end
  end
end
