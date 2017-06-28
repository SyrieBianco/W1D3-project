class Post < ActiveRecord::Base
  validates :title, :body, :user, presence: true

  has_many :tags
  belongs_to :user
end
