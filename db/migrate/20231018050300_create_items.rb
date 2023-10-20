class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.date :product_date
      t.references :product, foreign_key: true
      t.references :bill, foreign_key: true


      t.timestamps
    end
  end
end
