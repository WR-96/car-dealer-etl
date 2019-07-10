class CreatePartsProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_providers do |t|
      t.string :tradename
      t.string :phone
      t.string :cellphone
      t.string :email
      t.string :car_maker
      t.string :piece
      t.string :price

      t.timestamps
    end
  end
end
