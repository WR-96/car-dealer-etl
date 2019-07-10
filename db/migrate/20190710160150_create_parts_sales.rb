class CreatePartsSales < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_sales do |t|
      t.string :client_name
      t.string :employee_name
      t.string :date
      t.string :amount
      t.string :total

      t.timestamps
    end
  end
end
