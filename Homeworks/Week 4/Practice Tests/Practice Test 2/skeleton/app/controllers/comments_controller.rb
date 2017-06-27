class CommentsController < ApplicationController
  before_action :require_logged_in

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = params[:link_id]

    if @comment.save
      redirect_to link_url(params[:link_id])
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(params[:link_id])
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
