class CreateOrganizacions < ActiveRecord::Migration
  def change
    create_table :organizacions do |t|
      t.string :nombre
      t.string :subdominio
      t.integer :estatus
    end
  end
end
