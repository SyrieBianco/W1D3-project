# LinksController
#   GET #new
#     when logged in
#       renders the new links page
#     when logged out
#       redirects to the login page (FAILED - 6)
#   POST #create
#     when logged out
#       redirects to the login page (FAILED - 7)
#     when logged in
#       with invalid params
#         validates the presence of title and body (FAILED - 8)
#       with valid params
#         redirects to the link show page (FAILED - 9)
#   GET #index
#     when logged in
#       renders the new links page
#     when logged out
#       redirects to the login page (FAILED - 10)
#   GET #show
#     when logged in
#       renders the link show page (FAILED - 11)
#     when logged out
#       redirects to the login page (FAILED - 12)
#   GET #edit
#     when logged in
#       renders the edit link page (FAILED - 13)
#     when logged out
#       redirects to the login page (FAILED - 14)
#   PATCH #update
#     when logged in as a different user
#       should not allow users to update another users links (FAILED - 15)
#     when logged in as the correct user
#       should not allow users to update another users links (FAILED - 16)

class LinksController < ApplicationController
  before_action :require_logged_in

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    render :show
  end

  def update
    @link = Link.find_by(id: params[:id])

    unless @link.user == current_user
      flash.now[:errors] = ["You can only edit your own posts!"]
      render :show
    else
      @link.update_attributes(link_params)
      render :show
    end
  end

  def edit
    render :edit
  end

  def destroy

  end

  private

  def link_params
    params.require(:link).permit(:user, :title, :url)
  end

end
