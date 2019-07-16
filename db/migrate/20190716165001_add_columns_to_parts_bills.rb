class AddColumnsToPartsBills < ActiveRecord::Migration[5.2]
  def change
    add_column :parts_bills, :product, :string
    add_column :parts_bills, :price, :string
    add_column :parts_bills, :amount, :string
    add_column :parts_bills, :rfc, :string
  end
end
