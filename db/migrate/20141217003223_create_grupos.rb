class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.dte :fecha_inicio
      t.date :fecha_fin
      t.date :cierre_inscripcion
      t.integer :estatus
      t.references :curso, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
