class BaseDato < ActiveRecord::Migration
  def change
  	create_table(:base_datos) do |t|
      t.string :nombre, :null => false
    end
  end
end
