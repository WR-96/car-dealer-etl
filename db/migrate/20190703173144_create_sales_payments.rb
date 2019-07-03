class CreateSalesPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_payments do |t|
      t.string :client_name
      t.string :deal_number
      t.string :status
      t.string :due_date
      t.string :payment_date
      t.string :amount

      t.timestamps
    end
  end
end
