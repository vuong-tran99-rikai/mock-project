class DiscountDetailsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy, :edit ]
  # before_action :param_detail, only: %i[create]
  def new
      @addDiscount = DiscountDetail.new
      @books = Book.where(status: [1]).where("quantity > 0")
      @discount = Discount.all
  end
    
    def create
      # selected_book_id = params[:discount_detail][:book_id]
      # discount_id = params[:discount_detail][:discount_id]

      # selected_book_id.each do |book_id|
      #   DiscountDetail.create(book_id: book_id, discount_id: discount_id)
      # end
    
      # flash[:success] = 'Create thành công'
      # redirect_to '/add-discount'
      selected_book_id = params[:discount_detail][:book_id]
        discount_id = params[:discount_detail][:discount_id]
        conflicting_book_ids = []

        # selected_book_id.each do |book_id|
        #   current_discount = Discount.find_by(id: discount_id)
        #   existing_discount_detail = DiscountDetail.find_by(book_id: book_id)

        #   if existing_discount_detail && current_discount
        #     existing_discount = Discount.find(existing_discount_detail.discount_id)
        #     # byebug
        #     if (existing_discount.start_day <= current_discount.start_day && existing_discount.end_day >= current_discount.start_day) ||
        #       (existing_discount.start_day <= current_discount.end_day && existing_discount.end_day >= current_discount.end_day)
        #       conflicting_book_ids << book_id
        #     else
        #       DiscountDetail.create(book_id: book_id, discount_id: discount_id)
        #     end
        #   else
        #     DiscountDetail.create(book_id: book_id, discount_id: discount_id)
        #   end
        # end
        if(selected_book_id.blank?)
          flash[:danger] = 'không có dữ liệu'
          redirect_to request.referrer
        else
          selected_book_id.each do |book_id|
            current_discount = Discount.find_by(id: discount_id)
            existing_discount_details = DiscountDetail.where(book_id: book_id)
          
            if existing_discount_details.present? && current_discount.present?
              existing_discounts = existing_discount_details.map(&:discount)
          
              existing_discounts.each do |existing_discount|
                if (existing_discount.start_day <= current_discount.start_day && existing_discount.end_day >= current_discount.start_day) ||
                   (existing_discount.start_day <= current_discount.end_day && existing_discount.end_day >= current_discount.end_day || existing_discount.start_day >= current_discount.start_day && existing_discount.end_day <= current_discount.end_day)
                  conflicting_book_ids << book_id
                  break
                else
                  DiscountDetail.create(book_id: book_id, discount_id: discount_id)
                end
              end
            else
              DiscountDetail.create(book_id: book_id, discount_id: discount_id)
            end
          end
          if conflicting_book_ids.any?
            conflicting_book_names = Book.where(id: conflicting_book_ids).pluck(:name_book)
            flash[:error] = "Lỗi: Sách đã thuộc khuyến mãi khác trong khoảng thời gian cho sách: #{conflicting_book_names.join(', ')}"
            redirect_to request.referrer and return
          end
  
          flash[:success] = 'Create thành công'
          redirect_to '/add-discount'
        end  
    end

    def edit
      # @discount = Discount.find(params[:id])
      # # discount_details = Discount.joins(discount_detail: :book).where(discount_detail: { discount_id: @discount })
      # # @books = discount_details.pluck('discount_detail.id', :name_book)
      # discount_id = @discount.id
      # @books = Book.joins(discount_detail: :discount).where(discount_detail: { discount_id: discount_id })

      @discounts = Discount.find(params[:id])
      @books = @discounts.books.where(status: [0, 1])
      # byebug
      @discount_detail = @discounts.discount_detail
      @discount_book_ids = @discount_detail.pluck(:book_id)

      @bookEdit = Book.where.not(id: @discount_book_ids).where(status: [0, 1])
    end

    def update
      @discounts = Discount.find(params[:id])
      # byebug
      selected_book_id = params[:discount_detail][:book_id]
        discount_id = params[:discount_detail][:discount_id]
        conflicting_book_ids = []

        selected_book_id.each do |book_id|
          current_discount = Discount.find_by(id: @discounts.id)
          existing_discount_details = DiscountDetail.where(book_id: book_id)
        
          if existing_discount_details.present? && current_discount.present?
            existing_discounts = existing_discount_details.map(&:discount)
        
            existing_discounts.each do |existing_discount|
              if (existing_discount.start_day <= current_discount.start_day && existing_discount.end_day >= current_discount.start_day) ||
                 (existing_discount.start_day <= current_discount.end_day && existing_discount.end_day >= current_discount.end_day || existing_discount.start_day >= current_discount.start_day && existing_discount.end_day <= current_discount.end_day)
                conflicting_book_ids << book_id
                break
              else
                DiscountDetail.create(book_id: book_id, discount_id: @discounts.id)
              end
            end
          else
            DiscountDetail.create(book_id: book_id, discount_id: @discounts.id)
          end
        end

        if conflicting_book_ids.any?
          conflicting_book_names = Book.where(id: conflicting_book_ids).pluck(:name_book)
          flash[:error] = "Lỗi: Sách đã thuộc khuyến mãi khác trong khoảng thời gian cho sách: #{conflicting_book_names.join(', ')}"
          redirect_to request.referrer and return
        end

        flash[:success] = 'Uơdate thành công'
        redirect_to request.referrer
    end

    def destroy
      @discount = DiscountDetail.find_by(book_id: params[:book_id], discount_id: params[:id])
      @discount.delete
      redirect_to request.referrer
    end
    
    private
    
end