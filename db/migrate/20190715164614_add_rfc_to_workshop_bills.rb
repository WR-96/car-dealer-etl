class AddRfcToWorkshopBills < ActiveRecord::Migration[5.2]
  def change
    add_column :workshop_bills, :rfc, :string
  end
end
