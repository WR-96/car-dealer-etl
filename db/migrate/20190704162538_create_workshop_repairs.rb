class CreateWorkshopRepairs < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_repairs do |t|
      t.string :date
      t.string :mechanic_name
      t.string :car
      t.string :description
      t.string :total

      t.timestamps
    end
  end
end
