## STEP 0 ##

# run bundle install
# be rake db:create

## STEP 1 ##
# run rails g model ModelName for each table

## STEP 2 ##

# create migrations

# 2.1 create users table
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
# 2.2 create links table
class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :links, :user_id
  end
end
# 2.3 create comments table
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :link_id, null: false

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end



## STEP 3 ##

# make all models
# 3.1 make comment model (validations, associations)

class Comment < ActiveRecord::Base
  validates :body, :link, :user, presence: true

  belongs_to :user
  belongs_to :link
end

# 3.2 make link model

class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  belongs_to :user
  has_many :comments
end

# 3.3 make user model

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :links
  has_many :comments

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user && user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end

## STEP 4 ##

# make routes, run specs to identify routes
# 4.1 update routes.rb

Links::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :links
  resources :comments, only: [:create, :destroy]
end

# 4.2 make blank views for each "get" route (index, new, show, edit)

## STEP 5 ##

# make controllers

# 5.1 Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to links_url if logged_in?
  end

end

# 5.2 Users controller.
## START WITH USER PARAMS

class UsersController < ApplicationController

  def new
    @user = User.new ## <-- make a dummy user for partial logic
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
    params.require(:user).permit(:password, :username)
  end
end

# 5.3 Sessions controller

 class SessionsController < ApplicationController
   before_filter :require_logged_in

   def new
     render :new
   end

   def create
     user = User.find_by_credentials(
     params[:user][:username],
     params[:user][:password]
     )

     if user
       login(user)
       redirect_to links_url
     else
       flash.now[:errors] = ["Invalid username or password"]
       render :new
     end
   end

   def destroy
     logout!
     redirect_to new_session_url
   end
 end

# 5.4 Comments controller
# START WITH COMMENT PARAMS

class CommentsController < ApplicationController
  before_filter :require_logged_in

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment.link)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id) # <-- HACK, add a hidden input to pass this in as a param
  end
end


# 5.5 Link controller
# START WITH STRONG PARAMS

class CommentsController < ApplicationController

  def index
    @links = Link.all
    render :index
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])  ##<-- find link in links of current_user
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to links_url
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end

## STEP 6 ##

# views
