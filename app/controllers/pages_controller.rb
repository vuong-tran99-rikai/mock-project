class PagesController < ApplicationController
  def home
    
    if params[:search].present?
      @books = Book.where("name_book LIKE ?", "%#{params[:search]}%").order(:id)
      @category = Category.where(status: 1)
      @books_discount = DiscountDetail.all
    else
      @category = Category.where(status: 1)
      @books = Book.where(status: 1).order(:id)
      @books_discount = DiscountDetail.all
    end
  
  end

  def show
    @book = Book.find(params[:id])
    @evaluaters = Evaluater.where(book_id: @book.id)
  end

  def cart
    @cart = session[:cart]
  end

  def create
    
  end

  def add_item
    @book = Book.find(params[:id])
    redirect_to root_url
    # byebug
  end
end
