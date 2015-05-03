class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.string :user_ip
      t.string :type
      t.integer :action_num
      t.timestamps null: false
    end
  end
end
