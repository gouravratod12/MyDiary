class Item < ApplicationRecord


  belongs_to :product
  belongs_to  :bill


  # validates :product_date,:product_stock, presence: true



  def item_weight
     "#{weight} #{product.unit}".strip
  end


end
