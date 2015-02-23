class CreateTipoArchivos < ActiveRecord::Migration
  def change
    create_table :tipo_archivos do |t|
      t.string :nombre
      t.text :descripcion
      t.string :icono
    end
  end
end
