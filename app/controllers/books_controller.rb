class BooksController < ApplicationController
    protect_from_forgery with: :exception
def new
    @books = Book.new
end
def create
    @books = Book.new(book_params)
    @books.status = params[:status].to_i   

        if @books.save
        flash[:success] = 'Đã tạo thành công Book'
        redirect_to '/create-books'
            else
        flash[:danger] = 'Vui lòng nhập thông tin'
        render :new
        end
    
end
def index
    @books = Book.where(status: [0, 1])
    if(@books)
        @books = Book.where(status: [0, 1]).order(:id)
    else
        @books = []
    end
end
def toggle_status_book
    @books= Book.find(params[:id])
        if @books.Tạm_tắt?
            @books.status = 'Hiển thị'
        elsif @books.Hiển_thị?
            @books.status = 'Tạm tắt'
        end
        @books.save
        redirect_to '/books'
end
def destroy
    @books = Book.find(params[:id])
    @books.status = 2
    @books.save
    redirect_to '/books'
end
def edit
    @books = Book.where(status: [0, 1]).find(params[:id])
end
def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:success] = 'Update thành công'
      redirect_to '/books'
    else
      flash[:danger] = 'Book không tồn tại'
      redirect_to '/books'
    end
  end  

private
def book_params
    params.require(:book).permit(:name_book, :description, :author, :quantity,:price,:image , :category_id)
end
end