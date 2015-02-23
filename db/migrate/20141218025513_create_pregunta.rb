class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.text :enunciado
      t.integer :tipo
      t.references :evaluacion
    end
  end
end
