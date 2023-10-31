class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :seller_name
      t.date :seller_date
      t.string :seller_address
      t.string :seller_contact

      t.timestamps
    end
  end
end
