class AddServiceCoulmnToWorkshopBills < ActiveRecord::Migration[5.2]
  def change
    add_column :workshop_bills, :service, :string
  end
end
