class RenameTypeFromSuspectPostReport < ActiveRecord::Migration
  def change
  	 rename_column :suspect_post_reports, :type, :kind
  end
end
