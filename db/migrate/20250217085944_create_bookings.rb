class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.integer :status
      t.integer :participants
      t.references :user, foreign_key: true, null: false
      t.references :lesson, foreign_key: true, null: false
      t.timestamps
    end
  end
end
