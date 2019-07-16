class AddAmountToPartsSupplierOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :parts_supplier_orders, :price, :string
  end
end
