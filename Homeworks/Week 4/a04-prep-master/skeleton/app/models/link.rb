class Link < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true
  validates :user, presence: {message: "can't be blank"}

  belongs_to :user
  has_many :comments

end
