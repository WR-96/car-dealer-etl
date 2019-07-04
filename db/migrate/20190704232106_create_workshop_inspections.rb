class CreateWorkshopInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_inspections do |t|
      t.string :car
      t.string :mechanic_name
      t.string :date
      t.string :mileage
      t.string :fuel_level
      t.string :comment

      t.timestamps
    end
  end
end
