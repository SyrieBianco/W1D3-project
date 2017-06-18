class BoardMembership < ActiveRecord::Base
  belongs_to :board,
    primary_key: :id ,
    foreign_key: :board_id ,
    class_name: :Board

    belongs_to :member,
      primary_key: :id ,
      foreign_key: :member_id ,
      class_name: :Executive

  # has_many: ,
  #   primary_key: : ,
  #   foreign_key: : ,
  #   class_name: :
  #
  # has_many: ,
  #   through: :
  #   source: :
end
