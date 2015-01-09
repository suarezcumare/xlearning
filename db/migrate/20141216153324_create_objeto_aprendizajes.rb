class CreateObjetoAprendizajes < ActiveRecord::Migration
  def change
    create_table :objeto_aprendizajes do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :orden
    end
  end
end
