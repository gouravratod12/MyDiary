class BillManager < ApplicationRecord
  belongs_to :customer

  validates :bill_no, presence: true ,uniqueness: true
  validates :bill_date, presence: true
end
