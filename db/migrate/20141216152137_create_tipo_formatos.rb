class CreateTipoFormatos < ActiveRecord::Migration
  def change
    create_table :tipo_formatos do |t|
      t.string :nombre
    end
  end
end
