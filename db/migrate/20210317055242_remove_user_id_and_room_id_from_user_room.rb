class RemoveUserIdAndRoomIdFromUserRoom < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_rooms, :user_id, :integer
    remove_column :user_rooms, :room_id, :integer
  end
end
