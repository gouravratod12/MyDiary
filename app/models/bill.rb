class Bill < ApplicationRecord

  belongs_to :customer
  belongs_to :product
  has_many   :items

  accepts_nested_attributes_for :items , allow_destroy: true
  # validates :bill_date,:quantity,:amount, presence: true

end
