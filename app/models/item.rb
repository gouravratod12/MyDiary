class Item < ApplicationRecord


  belongs_to :product
  belongs_to  :bill

  # validates :product_date,:product_stock, presence: true



  def stock
     "#{bill.weight} #{product.unit}".strip
  end


end
