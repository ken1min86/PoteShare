class AddColumnIntroductionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :string, limit: 500
  end
end
