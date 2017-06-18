class WatchListItem < ActiveRecord::Base
  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id ,
    class_name: :Company

  belongs_to :watch_list,
    primary_key: :id,
    foreign_key: :watch_list_id,
    class_name: :WatchList
  # has_many: ,
  #   primary_key: : ,
  #   foreign_key: : ,
  #   class_name: :
  #
  # has_many: ,
  #   through: :
  #   source: :
end
