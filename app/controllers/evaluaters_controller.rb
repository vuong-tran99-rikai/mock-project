class EvaluatersController < ApplicationController
  def new
    @evaluater = Evaluater.new
    @book = Book.find(params[:id])
  end

  def create
    @evaluater = Evaluater.new(evaluater_params)
    @book = Book.find(params[:evaluater][:book_id])
    if @evaluater.save
      flash[:success] = "Đã thêm mới đánh giá"
      redirect_to detail_path(@book)
    else
      render :new
    end
  end

  def index
    @evaluater = Evaluater.all
  end

  private

  def evaluater_params
    params.require(:evaluater).permit(:book_id, :level, :comment, :user_id)
  end
end
