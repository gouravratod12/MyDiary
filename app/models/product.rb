class Product < ApplicationRecord

  has_many :items
  has_many :bills
  # validates :product_rate, presence: true, uniqueness: true
  def product_weight
     "#{product_rate} / #{unit}".strip
  end
end
