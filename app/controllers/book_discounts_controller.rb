class BookDiscountsController < ApplicationController
    def index
        if params[:discount_detail].present? && params[:discount_detail][:discount_id].present?
          @discounts = Discount.find_by(id: params[:discount_detail][:discount_id])
          if @discounts.present?
            @discount = Discount.where(status: 1)
            @book = @discounts.books.where(status: 1)
          else
            flash[:error] = "Không tìm thấy khuyến mãi"
            redirect_to '/book_discounts'
          end
        else
          @discount = Discount.where(status: 1)
          @book = Book.where(status: 1)
        end
    end
      
end
