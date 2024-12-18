class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.text :email

      t.timestamps
    end
  end
end
