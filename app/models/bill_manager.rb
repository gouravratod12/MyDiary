class BillManager < ApplicationRecord

  belongs_to :customer


  validates :bill_date, presence: true
end
