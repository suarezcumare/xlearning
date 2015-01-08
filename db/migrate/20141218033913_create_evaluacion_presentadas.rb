class CreateEvaluacionPresentadas < ActiveRecord::Migration
  def change
    create_table :evaluacion_presentadas do |t|
      t.float :puntuacion
      t.datetime :fecha_presentacion
      t.text :feedback
      t.references :usuario, index: true
      t.references :evaluacion_grupo, index: true
    end
  end
end
