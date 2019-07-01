class CreateSalesCars < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_cars do |t|
      t.string :model
      t.string :category
      t.string :maker
      t.string :color
      t.string :year
      t.string :price
      t.string :miles
      t.string :serial_number
      t.string :purchase_date

      t.timestamps
    end
  end
end
