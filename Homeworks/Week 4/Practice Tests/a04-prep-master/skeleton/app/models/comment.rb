class Comment < ActiveRecord::Base
  validates :body, :user, :link, presence: true

  belongs_to :link
  belongs_to :user
end
