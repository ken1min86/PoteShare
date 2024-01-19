class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :password_digest, :text, null: false

    add_index :users, :email, unique: true
  end
end
