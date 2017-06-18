class Board < ActiveRecord::Base



 # has a member (FAILED - 3)
 # has a single exchange (FAILED - 4)
 #

  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: :Company

  has_many :memberships,
    primary_key: :id,
    foreign_key: :board_id,
    class_name: :BoardMembership

  has_many :members,
    through: :memberships,
    source: :member

  has_one :exchange,
    through: :company,
    source: :exchange
end
