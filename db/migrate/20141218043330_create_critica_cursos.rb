class CreateCriticaCursos < ActiveRecord::Migration
  def change
    create_table :critica_cursos do |t|
      t.text :contenido
      t.float :puntuacion
      t.references :autor, index: true
      t.references :curso, index: true
    end
  end
end
