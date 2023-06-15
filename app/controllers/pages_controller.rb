class PagesController < ApplicationController
  def home
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
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
