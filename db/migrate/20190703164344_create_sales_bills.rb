class CreateSalesBills < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_bills do |t|
      t.string :deal_number
      t.string :date
      t.string :sub_total
      t.string :total
      t.string :tax_percentage
      t.string :tax

      t.timestamps
    end
  end
end
