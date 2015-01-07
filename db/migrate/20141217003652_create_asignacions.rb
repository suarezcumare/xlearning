class CreateAsignacions < ActiveRecord::Migration
  def change
    create_table :asignacions do |t|
      t.string :titulo
      t.text :descripcion
      t.text :instrucciones
      t.float :puntuacion
      t.references :curso, index: true
    end
  end
end
