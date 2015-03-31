class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.text :text
      t.timestamps null: false
    end
  end
end
