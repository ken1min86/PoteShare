class DeletecolumnEmailAndPasswordOfUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :password
    remove_column :users, :email
  end

  def down
    add_column :users, :email, :string
    add_column :users, :password, :text
  end
end
