class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.integer :num_of_people

      t.timestamps
    end
  end
end
