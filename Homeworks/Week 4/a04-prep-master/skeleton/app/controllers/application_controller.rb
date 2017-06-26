class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

private

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login(user)
    token = user.session_token
    session[:session_token] = token
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to links_url if logged_in?
  end

end
