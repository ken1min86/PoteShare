class DeleteUsersRoomsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_rooms
  end
end
