# should require body to be set (FAILED - 1)
# should require user to be set (FAILED - 2)
# should require link to be set (FAILED - 3)
# should belong to user (FAILED - 4)
# should belong to link (FAILED - 5)
#



class Comment < ActiveRecord::Base
  validates :body, :link, presence: true

  belongs_to :user
  belongs_to :link

  validates :user, presence: true
end
