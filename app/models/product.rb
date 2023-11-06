class Product < ApplicationRecord

  has_many :items
  include ActiveModel::Serializers::JSON
  # validates :product_rate, presence: true, uniqueness: true
  def stock_unit
     "#{stock}  #{unit}".strip
  end
end
