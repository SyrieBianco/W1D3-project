class Artist < ActiveRecord::Base
  has_many(
    :albums, class_name: "Album"
    )

  has_many(
    :tracks,
    through: :albums,
    source: :tracks
    )


  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums_with_count = self.albums
    .select('albums.*', 'COUNT(*) AS track_count')
    .joins(:tracks)
    .group('albums.id')

    album_count = {}
    albums_with_count.each do |album|
      album_count[album.title] = album.track_count
    end

    album_count
  end
end
