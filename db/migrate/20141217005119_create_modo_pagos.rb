class CreateModoPagos < ActiveRecord::Migration
  def change
    create_table :modo_pagos do |t|
      t.string :nombre
      t.text :descripcion
    end
  end
end
