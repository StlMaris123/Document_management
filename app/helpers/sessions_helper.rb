module SessionsHelper
  #logs in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  def remember(user)
    cookies[:remember_token] = { value: user.remember_token,
                                 expires: 7.days.from_now}
    cookies.permanent.signed[:user_id] = user.id
  end

  #logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
