module SessionsHelper
  #logs in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end
  def remember(user)
    log_in(user)
    cookies[:remember_token] = { value: user.remember_token,
                                 expires: 7.days.from_now}
    cookies.permanent.signed[:user_id] = user.id
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  #returns true if the given user is the current_user
  def current_user?(user)
    user == current_user
  end
  
  #Redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #Stores the URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
