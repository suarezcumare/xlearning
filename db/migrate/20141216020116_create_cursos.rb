class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.text :descripcion
      t.text :objetivos
      t.text :prerequisitos
      t.text :perfil_estudiante
      t.boolean :pago
      t.float :costo
      t.integer :matricula_maxima
      t.float :puntaje_aprobacion
      t.integer :horas_semanales
      t.boolean :estatus
      t.references :facilitador, index: true
      t.references :comentario, index: true
    end
  end
end