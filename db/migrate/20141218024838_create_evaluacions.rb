class CreateEvaluacions < ActiveRecord::Migration
  def change
    create_table :evaluacions do |t|
      t.references :curso, index: true
      t.string :titulo
      t.text :descripcion
      t.integer :duracion, :default => -1
      t.boolean :estatus, :default => 1
      t.integer :maxintentos, :default => 1
      t.integer :cant_preguntas_cerradas
      t.integer :cant_preguntas_abiertas
      t.float :valor_preguntas_abiertas
      t.float :valor_preguntas_cerradas
      t.float :puntuacion
      t.boolean :tipo
    end
  end
end
