class Executive < ActiveRecord::Base

  # has a membership (FAILED - 11)
  # is on a board (FAILED - 12)

  has_many :memberships,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: :BoardMembership

  has_many :boards,
    through: :memberships,
    source: :board
    
end
