class CreateWorkshopBills < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_bills do |t|
      t.string :client_name
      t.string :date
      t.string :sub_total
      t.string :tax_percentage
      t.string :tax_amount
      t.string :total

      t.timestamps
    end
  end
end
