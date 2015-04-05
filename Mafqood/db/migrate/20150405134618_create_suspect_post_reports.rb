class CreateSuspectPostReports < ActiveRecord::Migration
  def change
    create_table :suspect_post_reports do |t|
      t.integer :suspect_post_id
      t.string :type

      t.timestamps null: false
    end
  end
end