class CategoriesController < ApplicationController
    def new
        @categories = Category.new
    end
    def create
        @categories = Category.new(category_params)
        @categories.status = params[:status]
        if @categories.save
            flash[:success] = 'Đã tạo thành công Categrory'
            redirect_to '/create-categories'
        else
            flash[:danger] = 'vui lòng nhập thông tin'
            render :new
        end
        
    end
    
    private
    def category_params
        params.require(:category).permit(:name_category, :status)
    end
end
