class CreatePartsSupplierOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_supplier_orders do |t|
      t.string :employee_name
      t.string :date
      t.string :supplier_tradename
      t.string :status
      t.string :delivery_date
      t.string :article
      t.string :amount
      t.string :total

      t.timestamps
    end
  end
end
