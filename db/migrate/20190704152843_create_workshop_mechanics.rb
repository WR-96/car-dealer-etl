class CreateWorkshopMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_mechanics do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :email

      t.timestamps
    end
  end
end
