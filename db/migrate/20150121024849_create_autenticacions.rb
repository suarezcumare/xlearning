class CreateAutenticacions < ActiveRecord::Migration
  def change
    create_table :autenticacions do |t|
      t.references :usuario, index: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :token_secret

      t.timestamps
    end
  end
end
