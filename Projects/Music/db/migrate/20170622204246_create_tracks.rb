class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.integer :album_id, null: false
      t.string :track_type
      t.timestamps null: false
    end

    add_index :tracks, :album_id
  end
end

# A Track is a recording on an Album.
# You need a drop down to select the Album. Again, default select the appropriate Album in the drop down.
# Use radio buttons to mark a track as a "bonus" or "regular" track. Again, default select the appropriate value.
# Use a textarea to allow the user to enter lyrics.
