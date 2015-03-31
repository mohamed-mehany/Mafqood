class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.integer :user_id
      t.string :number
      t.timestamps null: false
    end
  end
end
