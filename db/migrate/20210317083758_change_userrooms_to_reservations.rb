class ChangeUserroomsToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_rooms, :reservations
  end
end
