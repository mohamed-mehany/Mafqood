class CreateSuspectPosts < ActiveRecord::Migration

  def change
    create_table :suspect_posts do |t|
      t.string :approximate_age
      t.string :gender
      t.string :location
      t.column :image, :binary, :size => 16.megabyte
      t.string :description
      t.string :special_signs
      t.string :reporter_name
      t.string :reporter_phone

      t.timestamps null: false
    end
  end
end
