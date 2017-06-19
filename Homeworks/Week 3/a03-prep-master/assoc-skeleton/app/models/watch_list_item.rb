class WatchListItem < ActiveRecord::Base

  # has a watchlist (FAILED - 17)
  # has a company (FAILED - 18)

  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: :Company

  belongs_to :watch_list,
    primary_key: :id,
    foreign_key: :watch_list_id,
    class_name: :WatchList

end
