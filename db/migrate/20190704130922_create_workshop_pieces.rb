class CreateWorkshopPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_pieces do |t|
      t.string :car
      t.string :maker
      t.string :description
      t.string :price

      t.timestamps
    end
  end
end
