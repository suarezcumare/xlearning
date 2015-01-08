class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.date :cierre_inscripcion
      t.boolean :estatus
      t.references :curso, index: true
      t.references :usuario, index: true
    end
  end
end
