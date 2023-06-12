module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:user_type] = user.type_account 
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged?
    !current_user.nil?
  end

  def admin_user?
    return true if session[:user_type] == 'admin'
    return false
  end
end
