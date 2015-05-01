class ModifyMissingAndFindingPostFields < ActiveRecord::Migration
  def change
    remove_column :missing_posts, :gender
    remove_column :finding_posts, :gender
    add_column :missing_posts, :gender, :string
    add_column :finding_posts, :gender, :string
    add_column :suspect_posts, :ip, :string
  end
end
