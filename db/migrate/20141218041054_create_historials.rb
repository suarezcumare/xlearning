class CreateHistorials < ActiveRecord::Migration
  def change
    create_table :historials do |t|
      t.float :nota
      t.boolean :aprobado
      t.references :curso, index: true
      t.references :usuario, index: true
    end
  end
end
