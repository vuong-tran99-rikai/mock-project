class Category < ApplicationRecord
    has_many :book
    
    # chúng ta sử dụng validation uniqueness với scope là một mảng chứa trường status. Đồng thời, 
    # chúng ta sử dụng conditions để chỉ định rằng validation uniqueness chỉ được áp dụng khi status có giá trị là 0 hoặc 1.
    validates :name_category, presence: true, uniqueness: { scope: [:status], conditions: -> { where(status: [0, 1]) } }
    enum status: { 'Tạm tắt': 0, 'Hiển thị': 1, delete_category: 2 }
end
