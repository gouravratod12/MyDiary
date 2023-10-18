class AddColumnsToProductBills < ActiveRecord::Migration[5.0]
  def change
    add_column :product_bills, :product_stock, :integer
    add_column :product_bills, :product_unit, :string
  end
end
