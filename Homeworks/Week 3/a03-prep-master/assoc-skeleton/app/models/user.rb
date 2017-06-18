class User < ActiveRecord::Base
  # has a watch list (FAILED - 2)
  # has watch list items (FAILED - 3)
  # can see watched tickers (FAILED - 4)

  has_many :watch_lists,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :WatchList

  has_many :watch_list_items,
    through: :watch_lists,
    source: :watch_list_items

  has_many :watched_companies,
    through: :watch_list_items,
    source: :company
end
