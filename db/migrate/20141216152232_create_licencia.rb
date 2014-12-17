class CreateLicencia < ActiveRecord::Migration
  def change
    create_table :licencia do |t|
      t.string :nombre
      t.text :descripcion
    end
  end
end
