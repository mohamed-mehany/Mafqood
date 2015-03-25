class CreateMissings < ActiveRecord::Migration
  def change
    create_table :missings do |t|
      t.integer :age
      t.string :location_id
      t.string :reporter_name
      t.string :reporter_phone
      t.string :description
      t.string :image
      t.string :gender
      t.string :special_signs

      t.timestamps null: false
    end
  end
end
