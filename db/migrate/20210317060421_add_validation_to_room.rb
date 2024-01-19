class AddValidationToRoom < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :roomname, :string, null: false, limit: 20
    change_column :rooms, :introduction, :text, null: false, limit: 500
    change_column :rooms, :fee, :integer, null: false
    change_column :rooms, :address, :string, null: false
    change_column :rooms, :room_img, :string, null: false
  end
end
