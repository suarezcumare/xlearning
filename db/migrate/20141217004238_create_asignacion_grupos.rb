class CreateAsignacionGrupos < ActiveRecord::Migration
  def change
    create_table :asignacion_grupos do |t|
      t.datetime :fecha_habilitacion
      t.datetime :fecha_cierre
      t.references :grupo, index: true
      t.references :asignacion, index: true
    end
  end
end
