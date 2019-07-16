class AddColumnsToPartsSales < ActiveRecord::Migration[5.2]
  def change
    add_column :parts_sales, :price, :string
    add_column :parts_sales, :product, :string
  end
end
