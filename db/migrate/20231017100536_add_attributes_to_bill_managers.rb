class AddAttributesToBillManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_managers, :quantity, :integer
    add_column :bill_managers, :amount, :integer
  end
end
