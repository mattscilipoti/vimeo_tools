class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :vimeo_client_id
      t.string :vimeo_client_secret
      t.string :vimeo_access_token

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
