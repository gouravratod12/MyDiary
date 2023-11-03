class RemoveColumnFromBills < ActiveRecord::Migration[5.0]
  def change
    remove_column :bills , :product_unit
    r
  end
end
