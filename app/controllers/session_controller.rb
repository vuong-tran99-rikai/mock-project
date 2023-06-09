class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination" # Not quite right!
      render "new"
    end
  end
end
