class CreateTipoEventos < ActiveRecord::Migration
  def change
    create_table :tipo_eventos do |t|
      t.string :titulo
      t.text :cuerpo

      t.timestamps
    end
  end
end
