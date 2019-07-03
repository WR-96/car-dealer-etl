class CreateSalesDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_deals do |t|
      t.string :client_name
      t.string :agent_name
      t.string :car
      t.string :price
      t.string :date
      t.string :monthly_payment
      t.string :payment_due_day

      t.timestamps
    end
  end
end
