class AddAttributesToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :quantity, :integer
    add_column :bills, :amount, :integer
  end
end
