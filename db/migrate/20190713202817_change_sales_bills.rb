class ChangeSalesBills < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :sales_bills do |t|
        dir.up do
          t.column :client_name, :string
          t.column :rfc, :string
          t.remove :deal_number
        end
        
        dir.down do
          t.remove :client_name
          t.remove :rfc
          t.column :deal_number, :string
        end
      end
    end
  end
end
