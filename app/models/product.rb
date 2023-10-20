class Product < ApplicationRecord

  has_many :items , dependent: :destroy

  validates :items, :product_rate, presence: true, uniqueness: true

end
