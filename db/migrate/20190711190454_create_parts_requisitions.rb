class CreatePartsRequisitions < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_requisitions do |t|
      t.string :employee_name
      t.string :date
      t.string :status
      t.string :delivery_date
      t.string :article
      t.string :amount

      t.timestamps
    end
  end
end
