class User < ActiveRecord::Base
  validates :username, presence: true
  validates :session_token, presence: true
end
