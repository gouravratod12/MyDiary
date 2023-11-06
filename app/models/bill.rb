class Bill < ApplicationRecord

  belongs_to :customer
  has_many   :items

  accepts_nested_attributes_for :items , allow_destroy: true
  # validates :bill_date,:quantity,:amount, presence: true
  def per_unit
    "#{item.unit}"
  end

  def total_price
    items.sum(&:amount)
  end

end
