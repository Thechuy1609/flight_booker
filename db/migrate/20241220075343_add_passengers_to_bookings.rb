class AddPassengersToBookings < ActiveRecord::Migration[8.0]
  def change
    add_column :bookings, :passengers, :integer
  end
end
