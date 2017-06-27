class LinksController < ApplicationController
  before_action :require_logged_in

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
