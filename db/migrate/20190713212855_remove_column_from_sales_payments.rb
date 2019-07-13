class RemoveColumnFromSalesPayments < ActiveRecord::Migration[5.2]
  def up
    remove_column :sales_payments, :deal_number
  end

  def down
    add_column :sales_payments, :deal_number, :string
  end
end
