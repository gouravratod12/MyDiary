class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|

      t.date :bill_date
      t.references :customer, null:false, foreign_key: true
      t.timestamps
    end
  end
end
