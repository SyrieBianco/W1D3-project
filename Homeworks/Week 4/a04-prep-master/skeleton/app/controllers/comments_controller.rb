# CommentsController
#   POST #create
#     when logged out
#       redirects to the login page (FAILED - 1)
#     when logged in
#       with invalid params
#         flashes errors (FAILED - 2)
#       with valid params
#         redirects to the link show page (FAILED - 3)
#   DELETE #destroy
#     when logged out
#       redirects to the login page (FAILED - 4)
#     when logged in
#       removes the comment and redirects back to the link (FAILED - 5)

class CommentsController < ApplicationController
  before_action :require_logged_in, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to link_url(params[:comment][link_id])
    end
  end

  def destroy
    Comment.find_by(params[:comment][id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end
end
