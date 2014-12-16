class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :rol, index: true
      t.references :opcionmenu, index: true

      t.timestamps
    end
  end
end
