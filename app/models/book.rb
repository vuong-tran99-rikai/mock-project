class Book < ApplicationRecord
    belongs_to :category
    validates :name_book, presence: true
    validates :desciption, presence: true
    validates :author, presence: true
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :category_id, presence: true
    validates :status, presence: true
end
