class CreateEntregaAsignacions < ActiveRecord::Migration
  def change
    create_table :entrega_asignacions do |t|
      t.text :comentario
      t.float :puntuacion
      t.datetime :fecha_subido
      t.binary :archivo
      t.integer :estatus
      t.text :feedback
      t.references :asignaciongrupo, index: true
      t.references :tipoformato, index: true
      t.references :usuario, index: true
    end
  end
end
