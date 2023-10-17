class Product < ApplicationRecord

  belongs_to :bill_manager

  validates :product_name, presence: true
  validates :product_rate, presence: true
end
