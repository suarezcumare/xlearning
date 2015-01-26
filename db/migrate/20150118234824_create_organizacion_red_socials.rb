class CreateOrganizacionRedSocials < ActiveRecord::Migration
  def change
    create_table :organizacion_red_socials do |t|
      t.references :organizacion, index: true
      t.references :red_social, index: true
      t.string :valor
    end
  end
end
