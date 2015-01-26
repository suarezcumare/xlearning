class CreateOrganizacions < ActiveRecord::Migration
  def change
    create_table :organizacions do |t|
      t.string :nombre
      t.string :subdominio
      t.integer :estatus
      t.string :logo
      t.string :slogan
      t.references :pais, index: true
      t.string :direccion
      t.text :descripcion
      t.string :telefono1
      t.string :telefono2
      t.string :telefono3
      t.string :telefono4
      t.string :email1
      t.string :email2
      t.string :email3
      t.string :email4
      t.references :usuario
    end
  end
end
