class Comment < ActiveRecord::Base
  validates :user, :link, :body, presence: true

  belongs_to :user
  belongs_to :link

end
