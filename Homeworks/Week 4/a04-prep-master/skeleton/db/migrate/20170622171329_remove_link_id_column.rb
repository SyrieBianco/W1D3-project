class RemoveLinkIdColumn < ActiveRecord::Migration
  def change
    remove_column :links, :link_id
  end
end
