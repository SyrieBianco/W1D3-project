# should require title to be set (FAILED - 6)
# should require url to be set (FAILED - 7)
# should require user to be set (FAILED - 8)
# should belong to user (FAILED - 9)
# should have many comments (FAILED - 10)


class Link < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true

  belongs_to :user
  has_many :comments

  validates :user, presence: true



end
