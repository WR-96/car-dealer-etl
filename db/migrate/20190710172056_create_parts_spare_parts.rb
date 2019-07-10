class CreatePartsSpareParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_spare_parts do |t|
      t.string :description
      t.string :car_model
      t.string :car_maker
      t.string :price
      t.string :stock
      t.string :reorder

      t.timestamps
    end
  end
end
