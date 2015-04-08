class ChangeGenderToBooleanInMissingposts < ActiveRecord::Migration
  def change
    remove_column :missing_posts, :gender
    add_column :missing_posts, :gender, :boolean
  end
end
