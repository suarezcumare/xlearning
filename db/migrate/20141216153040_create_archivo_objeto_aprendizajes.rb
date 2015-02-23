class CreateArchivoObjetoAprendizajes < ActiveRecord::Migration
  def change
    create_table :archivo_objeto_aprendizajes do |t|
      t.longbinary :archivo
      t.references :usuario, index: true
      t.datetime :fechasubido
      t.references :licencia, index: true
      t.references :tipo_formato, index: true
      t.references :dispositivo, index: true
      t.references :objeto_aprendizaje, index: true
    end
  end
end
