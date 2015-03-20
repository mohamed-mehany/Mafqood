class ChangeMissingsPostsToMissingPosts < ActiveRecord::Migration
  def change
    rename_table :missings_post, :missing_posts
  end
end
