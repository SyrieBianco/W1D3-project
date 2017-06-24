# returns to sign in with an non-existent user (FAILED - 15)
# returns to sign in on bad password (FAILED - 16)
# with valid credentials
# redirects user to links index on success (FAILED - 17)
# logs in the user (FAILED - 18)
# DELETE #destroy
# logs out the current user (FAILED - 19)

class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )

    if @user
      login(@user)
      redirect_to links_url
    else
        flash.now[:errors] = ["invalid username or password"]
        render :new
    end
  end

  def destroy
    logout!
    render :new
  end

end
