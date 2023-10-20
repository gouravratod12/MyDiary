class AddColumnsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :product_stock, :integer
    add_column :items, :product_unit, :string
  end
end
