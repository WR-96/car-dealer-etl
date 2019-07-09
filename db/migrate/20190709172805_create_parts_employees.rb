class CreatePartsEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_employees do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :email

      t.timestamps
    end
  end
end
