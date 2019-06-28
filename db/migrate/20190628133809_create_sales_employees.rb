class CreateSalesEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_employees do |t|
      t.string :name
      t.string :last_name
      t.bigint :phone
      t.string :email

      t.timestamps
    end
  end
end
