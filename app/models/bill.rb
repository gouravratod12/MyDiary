class Bill < ApplicationRecord

  belongs_to :customer
  has_many   :items

  accepts_nested_attributes_for :items , allow_destroy: true
  # validates :bill_date,:quantity,:amount, presence: true
  def per_unit
    "#{item.unit}"
  end

  def grand_total
    "#{items.sum(:amount)}"
  end


  def calculate_total(item)
     item.weight * item.product&.product_rate
  end

end
