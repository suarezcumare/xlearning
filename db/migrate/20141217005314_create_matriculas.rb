class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.integer :estatus
      t.references :usuario, index: true
      t.references :grupo, index: true
      t.datetime :fecha
    end
  end
end
