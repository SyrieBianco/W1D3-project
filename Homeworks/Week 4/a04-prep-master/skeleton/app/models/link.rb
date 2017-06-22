class Link < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true
  validates :user, presence: {message: "can't be blank"}

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :comments,
    primary_key: :id,
    foreign_key: :link_id,
    class_name: :Comment

end
