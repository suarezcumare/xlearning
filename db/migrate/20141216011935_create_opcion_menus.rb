class CreateOpcionMenus < ActiveRecord::Migration
  def change
    create_table :opcion_menus do |t|
      t.string :nombre
      t.integer :estatus
      t.string :url
      t.integer :padre
      t.references :menu, index: true
      t.string :icono
    end
  end
end
