class EvaluatersController < ApplicationController
  def new
    @evaluater = Evaluater.new
  end

  def create
    @evaluater = Evaluater.new(evaluater_params)
    if @evaluater.save
      flash[:success] = "Đã thêm mới đánh giá"
      redirect_to "/create-evaluater"
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
