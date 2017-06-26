class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    token = session[:session_token]
    @current_user ||= User.find_by_session_token(token)
    @current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def login!(user)
    session[:session_token] = user.session_token
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
