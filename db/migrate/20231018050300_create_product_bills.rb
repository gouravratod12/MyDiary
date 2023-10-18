class CreateProductBills < ActiveRecord::Migration[5.0]
  def change
    create_table :product_bills do |t|
      t.date :product_date
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
