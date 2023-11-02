class Product < ApplicationRecord

  has_many :items

  # validates :product_rate, presence: true, uniqueness: true
  def stock_unit
     "#{stock}  #{unit}".strip
  end
end
