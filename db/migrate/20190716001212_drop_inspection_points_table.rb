class DropInspectionPointsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :workshop_inspection_points
  end

  def down
    create_table :workshop_inspection_points do |t|
      t.string :car
      t.string :date
      t.string :point
      t.string :status
      t.string :comment

      t.timestamps
    end
  end
end
