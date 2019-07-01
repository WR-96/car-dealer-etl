class CreateSalesTestDrives < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_test_drives do |t|
      t.string :client_name
      t.string :agent_name
      t.string :car
      t.string :date
      t.string :hour
      t.string :license_number
      t.string :inital_miles
      t.string :final_miles

      t.timestamps
    end
  end
end
