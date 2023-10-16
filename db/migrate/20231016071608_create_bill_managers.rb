class CreateBillManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_managers do |t|
      t.string :bill_no
      t.date :bill_date
      t.references :customer, null:false, foreign_key: true
      t.timestamps
    end
  end
end