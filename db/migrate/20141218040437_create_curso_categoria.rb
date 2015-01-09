class CreateCursoCategoria < ActiveRecord::Migration
  def change
    create_table :curso_categoria do |t|
      t.references :categoria, index: true
      t.references :curso, index: true
    end
  end
end
