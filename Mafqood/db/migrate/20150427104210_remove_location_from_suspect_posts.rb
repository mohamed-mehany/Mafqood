class RemoveLocationFromSuspectPosts < ActiveRecord::Migration
  def change
    remove_column :suspect_posts, :location
  end
end
