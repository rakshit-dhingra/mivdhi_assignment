# db/migrate/20240802204341_create_bookings.rb
class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :coach, null: false, foreign_key: true
      t.datetime :time_slot, null: false
      t.string :day_of_week
      t.string :timezone

      t.timestamps
    end

    add_index :bookings, [:coach_id, :time_slot, :day_of_week], unique: true
  end
end
