class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.text :enunciado
      t.boolean :tipo
      t.references :evaluacion
    end
  end
end
