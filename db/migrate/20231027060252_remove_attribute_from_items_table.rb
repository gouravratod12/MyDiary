class RemoveAttributeFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :product_stock, :integer
  end
end
