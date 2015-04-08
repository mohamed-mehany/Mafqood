class AddColumnStatusToFindingPosts < ActiveRecord::Migration
  def change
    add_column :finding_posts, :status, :boolean
  end
end
