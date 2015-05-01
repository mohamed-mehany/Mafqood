class AddNameArToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :name_ar, :string
  end
end
