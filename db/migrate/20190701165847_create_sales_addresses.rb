class CreateSalesAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_addresses do |t|
      t.string :client_name
      t.string :address_line
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
