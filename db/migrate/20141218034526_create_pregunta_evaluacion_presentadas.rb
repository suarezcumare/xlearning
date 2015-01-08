class CreatePreguntaEvaluacionPresentadas < ActiveRecord::Migration
  def change
    create_table :pregunta_evaluacion_presentadas do |t|
      t.references :evaluacion, index: true
      t.references :pregunta, index: true
      t.references :respuesta, index: true
    end
  end
end
