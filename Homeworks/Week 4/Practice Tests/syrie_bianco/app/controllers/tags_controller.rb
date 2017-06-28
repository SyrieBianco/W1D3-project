class TagsController < ApplicationController
  before_action :require_logged_in


  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to post_url(@tag.post)
    else
      flash.now[:errors] = @tag.errors.full_messages
      render :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to post_url(@tag)
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end
end
