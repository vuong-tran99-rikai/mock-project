class PagesController < ApplicationController
  def home
    @books = Book.where(status: 1).order(:id)
    @books_discount = DiscountDetail.all
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
