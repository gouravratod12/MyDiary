class Bill < ApplicationRecord

  belongs_to :customer
  belongs_to :product
  has_many   :items

  # validates :bill_date,:quantity,:amount, presence: true
  def weight_unit
     "#{weight} #{product.unit}".strip
  end

end
