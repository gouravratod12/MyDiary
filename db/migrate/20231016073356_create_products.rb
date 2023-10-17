class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :product_rate
      t.references :bill_manager, null:false, foreign_key: true
      t.timestamps
    end
  end
end
