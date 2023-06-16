class CategoriesController < ApplicationController
    before_action :admin_user, only: [:new, :create, :update, :destroy, :show, :toggle_status, :edit]

    def new
        @categories = Category.new
    end
    def create
        @categories = Category.new(category_params)
        @categories.status = params[:category][:status].to_i
        # @categories.status 
        # @categories.status = :hienthi
        # @categories.status 
        # @categories.tamtat? 

        if @categories.save
            flash[:success] = 'Đã tạo thành công Categrory'
            redirect_to '/create-categories'
        else
            flash[:danger] = 'vui lòng nhập thông tin'
            render :new
        end
        
    end
    def show
        @categories = Category.where(status: [0, 1])
        if(@categories)
            @categories = Category.where(status: [0, 1]).order(:id)
        else
            @categories = []
        end
    end
    def toggle_status
        # @category = Category.find(params[:id])
        # if @category.tamtat?
        #     @category.hienthi!
        # elsif @category.hienthi?
        #     @category.tamtat!
        # end
        # redirect_to '/category'
        @category = Category.find(params[:id])
            if @category.Tạm_tắt?
                @category.status = 'Hiển thị'
            elsif @category.Hiển_thị?
                @category.status = 'Tạm tắt'
            end
            @category.save
            redirect_to '/category'
    end
    def destroy
        @category = Category.find(params[:id])
        @category.status = 2
        @category.save
        redirect_to '/category'
    end
    
    def edit
        @category = Category.where(status: [0, 1]).find_by(id: params[:id])
        # byebug
        unless @category.present?
            redirect_to '/category', flash: { danger: 'Không tồn tại' }
        end
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params.merge(status: params[:category][:status].to_i))
          flash[:success] = 'Update thành công'
          redirect_to '/category'
        else
          flash[:danger] = 'Category không tồn tại'
          redirect_to '/category'
        end
      end      
    private
    def category_params
        params.require(:category).permit(:name_category)
    end
end
