class Company < ActiveRecord::Base

 # has a price (FAILED - 1)
 # has a watch list (FAILED - 2)
 # has a watcher (FAILED - 3)
 # has a board (FAILED - 4)



  belongs_to :exchange,
    primary_key: :id,
    foreign_key: :exchange_id,
    class_name: :Exchange

  has_many :prices,
    primary_key: :id ,
    foreign_key: :company_id ,
    class_name: :Price

  has_one :board,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: :Board

  has_many :watchlistitems,
    primary_key: :id ,
    foreign_key: :company_id ,
    class_name: :WatchListItem

  has_many :watch_lists,
    through: :watchlistitems,
    source: :watch_list

  has_many :watchers,
    through: :watch_lists,
    source: :user

end
