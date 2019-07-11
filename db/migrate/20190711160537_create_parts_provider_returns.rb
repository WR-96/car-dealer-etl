class CreatePartsProviderReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_provider_returns do |t|
      t.string :provider_name
      t.string :date
      t.string :article
      t.string :refound
      t.string :comment

      t.timestamps
    end
  end
end
