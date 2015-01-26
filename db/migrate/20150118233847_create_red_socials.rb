class CreateRedSocials < ActiveRecord::Migration
  def change
    create_table :red_socials do |t|
      t.string :nombre
      t.string :icono
      t.string :url
    end
  end
end
