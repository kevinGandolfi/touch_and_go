class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :airplane, null: false, foreign_key: true
      t.date :start_day
      t.date :end_day

      t.timestamps
    end
  end
end
