class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string :titulo
      t.text :contenido
      t.references :grupo, index: true
      t.references :usuario, index: true
      t.datetime :publicado

      t.timestamps
    end
  end
end
