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

private
def book_params
    params.require(:book).permit(:name_book, :description, :author, :quantity, :category_id, :status)
end
end