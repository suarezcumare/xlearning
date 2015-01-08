class CreatePrelacions < ActiveRecord::Migration
  def change
    create_table :prelacions do |t|
      t.references :base, index: true
      t.references :materia_prelada, index: true
    end
  end
end
