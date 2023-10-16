class Customer < ApplicationRecord

     has_many  :bill_managers


     validates :customer_name, presence: true
     validates :customer_address, presence: true
     validates :customer_contact, presence: true , uniqueness: true , length: { is: 10},
     format: { with: /\A\d+\z/, message: "should contain only digits" }
     validates :customer_dateofjoining, presence: true

end
