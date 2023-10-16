class Product < ApplicationRecord

  validates :product_name, presence: true
  validates :product_rate, presence: true
end
