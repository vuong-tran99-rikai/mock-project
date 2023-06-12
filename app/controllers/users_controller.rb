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
    @user = User.new(user_params.merge!(status: 0, type_account: 0)) # 0: open, 0: customer
    if @user.save 
      flash[:info] = "User created successfully"
      log_in(@user)
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
