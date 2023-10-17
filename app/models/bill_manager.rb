class BillManager < ApplicationRecord
  belongs_to :customer
  has_many :product


  validates :bill_date, presence: true
end
