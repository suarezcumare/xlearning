class CreateNotificacions < ActiveRecord::Migration
  def change
    create_table :notificacions do |t|
      t.text :descripcion
      t.string :titulo
      t.datetime :fecha
      t.references :usuario, index: true
      t.references :grupo, index: true
    end
  end
end
