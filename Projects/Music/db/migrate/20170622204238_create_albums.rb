class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.string :recording_type, null: false

      t.timestamps null: false
    end
  end
end


# An Album contains many Tracks.
# Don't call it Record, as ActiveRecord uses record_id internally.
# Have a drop-down to select which Band recorded the Album. Use selected to default-select the appropriate Band in the drop-down.
# Use radio buttons to select whether the album is a live or studio album. Don't use a column named type, since Rails uses this
# for a special purpose and everything will break. Use checked to default select the appropriate value.
