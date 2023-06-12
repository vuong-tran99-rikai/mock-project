class BooksController < ApplicationController
  def new
    @books = Book.new
end
def create
    @books = Book.new(book_params)
    @books.status = params[:status].to_i   

    if @books.save
        flash[:success] = 'Đã tạo thành công Categrory'
        redirect_to '/create-books'
    else
        flash[:danger] = 'vui lòng nhập thông tin'
        render :new
    end
    
end

private
def book_params
    params.require(:book).permit(:name_book, :description, :author, :quantity, :category_id, :status)
end
end