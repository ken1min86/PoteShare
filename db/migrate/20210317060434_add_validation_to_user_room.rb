class AddValidationToUserRoom < ActiveRecord::Migration[6.1]
  def change
    change_column :user_rooms, :start_date, :date, null: false
    change_column :user_rooms, :end_date, :date, null: false
    change_column :user_rooms, :num_of_people, :integer, null: false
  end
end
