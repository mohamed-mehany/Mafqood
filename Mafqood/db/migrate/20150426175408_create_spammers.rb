class CreateSpammers < ActiveRecord::Migration
  def change
    create_table :spammers do |t|
      t.integer :user_id
      t.string :user_ip
      t.string :type
      t.timestamps null: false
    end
  end
end
