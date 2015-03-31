class CreateChangeLocationIdToLocations < ActiveRecord::Migration
  def change
    create_table :change_location_id_to_locations do |t|
      remove_column :missings, :location_id
      add_column :missings, :location, :string
      t.timestamps null: false
    end
  end
end
