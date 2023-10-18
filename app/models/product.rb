class Product < ApplicationRecord

  has_many :product_bills

  validates :product_name, :product_rate, presence: true

end
