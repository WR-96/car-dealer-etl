class CreateSalesClients < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_clients do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :email
      t.string :rfc

      t.timestamps
    end
  end
end
