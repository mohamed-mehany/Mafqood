class AddLocationIdToSuspectPosts < ActiveRecord::Migration
  def change
    add_column :suspect_posts, :location_id, :integer
  end
end
