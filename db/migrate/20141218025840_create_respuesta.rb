class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.text :valor
      t.boolean :correcta
      t.references :pregunta, index: true
    end
  end
end
