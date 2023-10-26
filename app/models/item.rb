class Item < ApplicationRecord


  belongs_to :product


  # validates :product_date,:product_stock, presence: true



  def stock
     "#{product_stock} #{product_unit}".strip
  end


end
