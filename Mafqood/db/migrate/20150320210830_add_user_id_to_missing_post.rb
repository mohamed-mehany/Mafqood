class AddUserIdToMissingPost < ActiveRecord::Migration
  def change
    add_column :missing_posts, :user_id, :integer
  end
end
