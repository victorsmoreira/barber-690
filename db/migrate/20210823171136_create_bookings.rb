class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :appointment
      t.integer :rating
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :haircut, null: false, foreign_key: true

      t.timestamps
    end
  end
end
