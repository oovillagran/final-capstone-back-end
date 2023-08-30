class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
