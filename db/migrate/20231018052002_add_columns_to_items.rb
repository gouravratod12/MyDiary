class AddColumnsToItems < ActiveRecord::Migration[5.0]
  def change
     add_column :items , :weight ,:integer
     add_column :items , :amount ,:integer
     add_column :items , :item_date, :date
  end
end
