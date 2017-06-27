class Comment < ActiveRecord::Base
  validates :body, :user_id, :link_id, presence: true

  belongs_to :user
  belongs_to :link

  validates :user, :link, presence: true
end
