class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :suma_puntajes
      t.integer :cantidad_votos
      t.references :curso, index: true
    end
  end
end
