class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :imagen
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
      t.string :imagen_url
      t.string :foto
    end
  end
end
