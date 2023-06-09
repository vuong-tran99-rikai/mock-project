class Category < ApplicationRecord
    has_many :book
    validates :name_category, presence: true
end
