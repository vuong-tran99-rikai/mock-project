class EvaluatersController < ApplicationController
  def new
    @evaluater = Evaluater.new
  end

  def create
    @evaluater = Evaluater.new(evaluater_params)
    if @evaluater.save
      redirect_to @evaluater, notice: 'Đã thêm mới đánh giá'
    else
      render :new
    end
  end

  private

  def evaluater_params
    params.require(:evaluater).permit(:book_id, :level, :user_id)
  end
end