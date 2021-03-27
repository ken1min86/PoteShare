class AddUserIdAndRoomIdToUserRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :user_rooms, :user_id, :integer
    add_column :user_rooms, :room_id, :integer
    add_foreign_key :user_rooms, :users
    add_foreign_key :user_rooms, :rooms
  end
end
