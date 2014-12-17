class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.integer :orden
      t.references :modulo, index: true
      t.references :objeto_aprendizaje, index: true
    end
  end
end
