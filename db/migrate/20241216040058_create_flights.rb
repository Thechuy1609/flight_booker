class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :date_time
      t.string :flight_duration

      t.timestamps
    end
  end
end
