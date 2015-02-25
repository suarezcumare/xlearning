class CreateAsignacions < ActiveRecord::Migration
  def change
    create_table :asignacions do |t|
      t.string :titulo
      t.text :descripcion
      t.text :instrucciones
      t.float :puntuacion
      t.references :modulo, index: true
      t.references :tipo_archivo, index: true
    end
  end
end
