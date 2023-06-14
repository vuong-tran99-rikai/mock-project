class Discount < ApplicationRecord
    has_many :discount_detail
    has_many :books, through: :discount_detail
    validates :name_KM, presence: true, uniqueness: { scope: [:status], conditions: -> { where(status: [0, 1]) } }
    validates :gia_KM, presence: true
    enum status: { 'Tạm tắt': 0, 'Hiển thị': 1, delete_category: 2 }
end
