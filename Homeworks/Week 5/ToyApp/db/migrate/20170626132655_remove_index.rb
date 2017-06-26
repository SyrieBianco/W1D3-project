class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index :toys, :name
  end
end
