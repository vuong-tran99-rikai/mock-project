class Invoice < ApplicationRecord

  enum status: {
    borrowed: 0,
    returned: 1
  }    

  validates :address, presence: true
  validates :phone, presence: true
  validates :expiry_date, presence: true
  
end
