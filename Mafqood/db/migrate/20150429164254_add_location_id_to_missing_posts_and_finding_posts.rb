class AddLocationIdToMissingPostsAndFindingPosts < ActiveRecord::Migration
  def change
    remove_column :missing_posts, :location
    remove_column :finding_posts, :location
    add_column :missing_posts, :location_id, :integer
    add_column :finding_posts, :location_id, :integer
  end
end
