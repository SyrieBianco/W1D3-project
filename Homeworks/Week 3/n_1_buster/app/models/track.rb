class Track < ActiveRecord::Base
  belongs_to(
    :album, class_name: "Album"
  )
end
