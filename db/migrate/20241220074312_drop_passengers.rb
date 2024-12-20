class DropPassengers < ActiveRecord::Migration[8.0]
  def change
      drop_table :passengers
  end
end
