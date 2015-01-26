class CreateNotificacions < ActiveRecord::Migration
  def change
    create_table :notificacions do |t|
      t.references :notificble, index: true
      t.datetime :fecha
      t.references :usuario, index: true
      t.references :tipo_notificacion, index: true
      t.boolean :leido
      t.string :contexto
    end
  end
end
