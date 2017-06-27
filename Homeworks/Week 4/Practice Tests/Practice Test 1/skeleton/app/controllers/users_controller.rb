#
# GET #new
#   renders the new users template (FAILED - 25)
# POST #create
#   with invalid params
#     validates the presence of the user's username and password (FAILED - 26)
#     validates that the password is at least 6 characters long (FAILED - 27)
#   with valid params
#     redirects user to links index on success (FAILED - 28)
#     logs in the user (FAILED - 29)
#


class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to links_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
