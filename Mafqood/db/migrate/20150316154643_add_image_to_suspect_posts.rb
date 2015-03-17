class AddImageToSuspectPosts < ActiveRecord::Migration
  def change
    add_column :suspect_posts, :image, :string
  end
end
