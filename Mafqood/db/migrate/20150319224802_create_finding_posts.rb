class CreateFindingPosts < ActiveRecord::Migration
  def change
    create_table :finding_posts do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :special_signs
      t.integer :age
      t.string :image
      t.string :contact_info
      t.boolean :gender

      t.timestamps null: false
    end
  end
end
