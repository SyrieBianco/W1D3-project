class Band < ActiveRecord::Base
  validates :name, prescence: true

  has_many :albums
  has_many :tracks,
    through: :albums,
    source: :tracks


end
