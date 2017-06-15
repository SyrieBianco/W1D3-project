class Album < ActiveRecord::Base
  belongs_to(
    :artist, class_name: "Artist"
    )

  has_many(
    :tracks, class_name: "Track"
    )
end
