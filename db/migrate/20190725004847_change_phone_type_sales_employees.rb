class ChangePhoneTypeSalesEmployees < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :sales_employees do |t|
        dir.up   {t.change :phone, :string}
        dir.down {t.change :phone, :integer}
      end
    end
  end
end
