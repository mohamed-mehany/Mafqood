class RenameMissingsToMissingsPost < ActiveRecord::Migration
  def change
    rename_table :missings, :missings_post
  end
end
