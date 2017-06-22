class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password])

    if @user.nil?
      flash.now[:errors] = ["invalid username or password"]
      render :new
    else
      login!(@user)
      redirect_to links_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    render :new
  end


end
