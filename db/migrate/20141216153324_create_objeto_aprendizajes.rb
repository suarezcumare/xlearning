class CreateObjetoAprendizajes < ActiveRecord::Migration
  def change
    create_table :objeto_aprendizajes do |t|
      t.string :nombre
      t.text :descripcion
      t.references :tipo_archivo
    end
  end
end
