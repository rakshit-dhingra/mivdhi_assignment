class CreateCoachAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :coach_availabilities do |t|
      t.references :coach, null: false, foreign_key: true
      t.string :day_of_week
      t.time :available_at
      t.time :available_until
      t.boolean :booked

      t.timestamps
    end
  end
end
