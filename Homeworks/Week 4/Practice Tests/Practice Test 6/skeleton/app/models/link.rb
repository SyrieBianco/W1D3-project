class Link < ActiveRecord::Base
  validates :user, :title, :url, presence: true

  belongs_to :user
  has_many :comments
end
