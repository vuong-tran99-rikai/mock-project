class SessionController < ApplicationController
  def new
  end

  def create
    if params[:session][:email].empty? || params[:session][:password].empty?
      flash.now[:danger] = "Vui lòng nhập tài khoản, mật khẩu"
      render "new"
    elsif params[:session][:email].include?(" ") || params[:session][:password].include?(" ")
      flash.now[:danger] = "Vui lòng nhập tài khoản, mật khẩu"
      render "new"
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user.deleted?
        flash.now[:danger] = "Tài khoản không tồn tại"
        render "new"
      else
        if user.closed?
          flash.now[:danger] = "Tài khoản của bạn đã bị khóa"
          render "new"
        else
          if user && user.authenticate(params[:session][:password])
            log_in user
            remember user
            redirect_to user
          else
            flash.now[:danger] = "Tài khoản hoặc mật khâu không chính xác" # Not quite right!
            render "new"
          end
        end
      end
    end
    
  end

  def destroy
    log_out if logged?
    redirect_to root_url
  end

end

