class CreateMissingPostReports < ActiveRecord::Migration
  def change
    create_table :missing_post_reports do |t|
      t.integer :user_id
      t.integer :missing_post_id
      t.string :type
      t.timestamps null: false
    end
  end
end