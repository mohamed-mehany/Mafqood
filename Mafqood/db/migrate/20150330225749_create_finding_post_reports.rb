class CreateFindingPostReports < ActiveRecord::Migration
  def change
    create_table :finding_post_reports do |t|
      t.integer :user_id
      t.integer :finding_post_id
      t.string :kind

      t.timestamps null: false
    end
  end
end
