class Item < ApplicationRecord

  attribute :product_id, :integer
  belongs_to :product, optional: true
  belongs_to  :bill, optional: true


  # validates :product_date,:product_stock, presence: true


  def item_weight
      "#{weight} #{product.unit}".strip
  end



end
