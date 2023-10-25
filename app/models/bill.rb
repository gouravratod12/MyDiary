class Bill < ApplicationRecord

  belongs_to :customer
  has_many  :items


  validates :bill_date,:quantity,:amount, presence: true



end
