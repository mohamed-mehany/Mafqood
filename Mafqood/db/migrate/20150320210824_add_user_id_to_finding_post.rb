class AddUserIdToFindingPost < ActiveRecord::Migration
  def change
    add_column :finding_posts, :user_id, :integer
  end
end
