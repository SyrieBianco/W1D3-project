class Tag < ActiveRecord::Base
  validates :name, :post, presence: true

  belongs_to :post
end
