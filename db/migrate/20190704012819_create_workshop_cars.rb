class CreateWorkshopCars < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_cars do |t|
      t.string :client_name
      t.string :maker
      t.string :car
      t.string :color
      t.string :year
      t.string :license_plate
      t.string :serial_number

      t.timestamps
    end
  end
end
