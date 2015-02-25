class CreateEvaluacionGrupos < ActiveRecord::Migration
  def change
    create_table :evaluacion_grupos do |t|
      t.datetime :fecha_habilitacion
      t.datetime :fecha_cierre
      t.references :evaluacion, index: true
      t.references :grupo, index: true
      t.timestamps
    end
  end
  def down ; drop_table 'evaluacionGrupos'; end
end
