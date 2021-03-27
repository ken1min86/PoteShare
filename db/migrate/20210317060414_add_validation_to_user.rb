class AddValidationToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :username, :string, null: false, limit: 20
    change_column :users, :email, :string, null: false, unique: true
    change_column :users, :password, :integer, null: false
    change_column :users, :user_img, :string, null: false, default: 'default_icon.jpg'
  end
end
