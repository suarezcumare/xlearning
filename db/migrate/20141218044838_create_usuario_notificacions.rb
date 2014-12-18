class CreateUsuarioNotificacions < ActiveRecord::Migration
  def change
    create_table :usuario_notificacions do |t|
      t.boolean :revisado, :default => 0
      t.references :notificacion, index: true
      t.references :usuario, index: true
    end
  end
end
