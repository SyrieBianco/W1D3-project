class LinksController < ApplicationController
  before_filter :require_signed_in!

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    link = Link.new
  end

  def create
    @link = Link.new(params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to links_url(@link)
    else
      flash.now[:errors] = @link.errors
      redirect_to new_link_url
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.save(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:error] = @link.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to link_url(link)
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end