class ChangeTypeToKindInMissingPostReport < ActiveRecord::Migration
  def change
    remove_column :missing_post_reports, :type
    add_column :missing_post_reports, :kind, :string
  end
end
