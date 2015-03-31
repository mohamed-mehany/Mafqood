class DeleteColumnImageFromSuspectPosts < ActiveRecord::Migration
  def change
  	remove_column :suspect_posts, :image
  end
end
