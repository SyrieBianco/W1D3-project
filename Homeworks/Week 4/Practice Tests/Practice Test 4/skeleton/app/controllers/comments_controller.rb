class CommentsController < ApplicationController
  before_action :require_logged_in
  
  def create
    comment = current_user.comments.new(comment_params)
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment.link)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
