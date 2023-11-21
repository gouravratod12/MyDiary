class Product < ApplicationRecord

  attr_accessor :product_id
  has_many :items
  include ActiveModel::Serializers::JSON
  # validates :product_rate, presence: true, uniqueness: true
  def stock_unit
     "#{stock}  #{unit}".strip
  end

  def product_id
    read_attribute(:product_id)
  end

  # Setter
  def product_id=(new_id)
    write_attribute(:product_id, new_id)
  end

  before_save do
    items.destroy_all
  end
end
