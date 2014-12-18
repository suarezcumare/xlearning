class CreateRespuestaEvaluacionPresentadas < ActiveRecord::Migration
  def change
    create_table :respuesta_evaluacion_presentadas do |t|
      t.text :respuesta
      t.references :respuesta, index: true
    end
  end
end
