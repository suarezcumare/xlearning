class CreateBitacoraUsuarios < ActiveRecord::Migration
  def change
    create_table :bitacora_usuarios do |t|
      t.datetime :fecha
      t.references :trackeable, polymorphic: true, index: true
      t.references :tipo_evento, index: true
      t.references :usuario, index: true
    end
  end
end
