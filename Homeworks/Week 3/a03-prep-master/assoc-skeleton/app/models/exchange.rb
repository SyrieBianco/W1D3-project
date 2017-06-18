class Exchange < ActiveRecord::Base
  # belongs_to: ,
  #   primary_key: :id ,
  #   foreign_key: : ,
  #   class_name: :

  has_many :companies,
    primary_key: :id ,
    foreign_key: :exchange_id ,
    class_name: :Company

  # has_many: ,
  #   through: :
  #   source: :
end
