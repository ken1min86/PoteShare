class AddColumnSumOfFeeToReservation < ActiveRecord::Migration[6.1]
  add_column :reservations, :sum_of_fee, :integer, null: false
end
