class CreateWorkshopBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_bookings do |t|
      t.string :mechanic_name
      t.string :client_name
      t.string :car
      t.string :date
      t.string :hour
      t.string :description

      t.timestamps
    end
  end
end
