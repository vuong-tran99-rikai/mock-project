class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:info] = "User created successfully"
      redirect_to @user
    else
      flash[:error] = "An error has occurred"
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = 'User deleted successfully'
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
