class Book < ApplicationRecord
    belongs_to :category
    has_many :discount_detail
    has_many :discounts, through: :discount_details
    validates :name_book, presence: true
    validates :description, presence: true
    validates :author, presence: true
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :category_id, presence: true
    enum status: { 'Tạm tắt': 0, 'Hiển thị': 1, delete_book: 2, daxoa: 3 }

end
