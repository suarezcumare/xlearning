class CreateUsuarioRedSocials < ActiveRecord::Migration
  def change
    create_table :usuario_red_socials do |t|
      t.references :usuario, index: true
      t.references :red_social, index: true
      t.string :valor
    end
  end
end
