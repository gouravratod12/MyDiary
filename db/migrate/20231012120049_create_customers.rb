class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_contact
      t.date   :customer_dateofjoining

      t.timestamps
    end
  end
end
