class AddColumnStatusToMissingPosts < ActiveRecord::Migration
  def change
    add_column :missing_posts, :status, :boolean
  end
end
